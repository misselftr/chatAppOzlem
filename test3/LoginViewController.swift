//
//  ViewController.swift
//  test3
//
//  Created by ÖZLEM ATABAY on 29.11.2015.
//  Copyright © 2015 ÖZLEM ATABAY. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBAction func LoginBtn(sender: AnyObject) {
        
        let ref = Firebase(url: "https://chattestozlem.firebaseio.com")
        ref.authUser(emailTxt.text, password: passwordTxt.text,
            withCompletionBlock: { error, authData in
                
                if error != nil {
                    // There was an error logging in to this account
                } else {
                    // We are now logged in
                    //create alert
                   
                    
                    let alert = UIAlertController(title: "Logged In", message: "Successfully logged in", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // add an action
                  //  alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("peopleSegue", sender: self)}))
                    
                    //show the alert
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

