//
//  ViewController.swift
//  PKStatusBarLoader
//
//  Created by kansaraprateek on 05/05/2017.
//  Copyright (c) 2017 kansaraprateek. All rights reserved.
//

import UIKit
import PKStatusBarLoader

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PKStatusBarLoader.setBackgroundColor(color: UIColor.orange)
        PKStatusBarLoader.show(withMessage: "Yayyy")
        
        perform(#selector(self.showAnotherMessage), with: nil, afterDelay: 3.0)
    }
    
    func showAnotherMessage() {
        PKStatusBarLoader.show(withMessage: "Another Message!!!!!")
//        perform(#selector(self.dismissStatus), with: nil, afterDelay: 3.0)
    }
    
    func dismissStatus() {
        PKStatusBarLoader.dismiss()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

