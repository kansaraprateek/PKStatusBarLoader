//
//  PKStatusBarLoader.swift
//  Pods
//
//  Created by Prateek Kansara on 05/05/17.
//
//

import Foundation
import QuartzCore

private let statusBar = PKStatusBarLoader()
public class PKStatusBarLoader: UIWindow {
    
    var activityIndicator : UIActivityIndicatorView?
    var messageLabel : UILabel?
    
    var isActivityIndicatorShown : Bool = true
    
    var gMessage : String? = ""
    
    public class func setBackgroundColor(color : UIColor){
        statusBar.backgroundColor = color
    }
    
    public class func show(withMessage : String) {
        
        statusBar.gMessage = withMessage
        statusBar.setupLabelAndActivityIndicator()
        statusBar.showStatusMessage(animating: true)
        
    }
    
    public class func dismiss(){
        statusBar.removeStatusWindow()
    }
    
    public class func hideActivityIndicator(){
        statusBar.isActivityIndicatorShown = false
        statusBar.setupLabelAndActivityIndicator()
    }
    
    init() {
        let screen = UIScreen.main.bounds
        super.init(frame: CGRect(x: 0, y: 0, width: screen.width, height: 0))
        
        self.windowLevel = UIWindowLevelStatusBar+1
        self.initializeViews()
    }
    
    private func initializeViews(){
        
        self.messageLabel = UILabel()
        self.addSubview(self.messageLabel!)
        self.messageLabel?.textColor = UIColor.white
        self.messageLabel?.font = PKStatusLoaderConstant().messageFont
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showStatusMessage(animating : Bool) {
        
        self.messageLabel?.text = self.gMessage
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 0)
        DispatchQueue.main.async(execute: {
            self.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
                self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
                
            })
        })
    }
    
    private func setupLabelAndActivityIndicator(){
        let messageLength = self.getMessageSize()
        var activtiySize : CGFloat = 0
        if isActivityIndicatorShown{
            activtiySize = PKStatusLoaderConstant().activityIndicatorSize + PKStatusLoaderConstant().messageAndActivityDiff
        }
        let availableWidth = self.frame.width - (PKStatusLoaderConstant().messageEdgeMargin * 2) - activtiySize //(update with activity size)
        
        self.messageLabel?.frame = CGRect(x: (self.frame.width/2) - (messageLength.width/2), y: 0, width: messageLength.width, height: 20)
        if messageLength.width > availableWidth{
            self.messageLabel?.frame = CGRect(x: 0, y: 0, width: (self.frame.width/2) - (availableWidth/2), height: 20)
        }
        
        if isActivityIndicatorShown{
            self.activityIndicator?.removeFromSuperview()
            self.activityIndicator = UIActivityIndicatorView.init(frame: CGRect(x: (self.messageLabel?.frame.origin.x)! - activtiySize, y : 2.5, width: PKStatusLoaderConstant().activityIndicatorSize, height : PKStatusLoaderConstant().activityIndicatorSize))
            self.activityIndicator?.startAnimating()
            self.activityIndicator?.transform = CGAffineTransform.init(scaleX: 0.5 , y: 0.5)
            self.addSubview(self.activityIndicator!)
        }
    }
    
    private func getMessageSize() -> CGSize{
        let fontAttribute : [String: Any] = [NSFontAttributeName : PKStatusLoaderConstant().messageFont!]
        return (self.gMessage! as NSString).size(attributes: fontAttribute)
    }
    
    private func removeStatusWindow(){
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 20)
        DispatchQueue.main.async(execute: {
            UIView.animate(withDuration: 0.5, animations: {
                self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 0)
            }, completion: {
                _ in
                self.isHidden = true
            })
        })
    }
}

class PKStatusLoaderConstant: NSObject {
    
    let activityIndicatorSize : CGFloat = 15
    let messageEdgeMargin : CGFloat = 10
    let messageAndActivityDiff : CGFloat = 5
    let messageFont = UIFont.init(name: "AvenirNext-Medium", size: 10.0)
}
