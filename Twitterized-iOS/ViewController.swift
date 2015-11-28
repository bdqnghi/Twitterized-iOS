//
//  ViewController.swift
//  Twitterized-iOS
//
//  Created by Nghi Bui on 11/28/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onLoginClicked(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            
            print(user)
            
            if user != nil {
                
            } else {
                // handle login error
            }
        }
    }
}

