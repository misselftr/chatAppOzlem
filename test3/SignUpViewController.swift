//
//  SignUpViewController.swift
//  test3
//
//  Created by ÖZLEM ATABAY on 29.11.2015.
//  Copyright © 2015 ÖZLEM ATABAY. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBAction func cancelBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signUpBtn(sender: AnyObject) {
       
        let ref = Firebase(url: "https://chattestozlem.firebaseio.com")
        
        ref.createUser(emailTxt.text, password: passTxt.text,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    
                    //create alert
                    let alert = UIAlertController(title: "Created", message: "Registration Complete", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    // add an action
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    //show the alert
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                self.dismissViewControllerAnimated(false, completion: nil)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
