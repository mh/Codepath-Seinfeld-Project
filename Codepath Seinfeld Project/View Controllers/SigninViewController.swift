//
//  SigninViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4
import AFNetworking

class SigninViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: UIButton) {
        
        PFUser.logInWithUsernameInBackground(self.nameTextField.text!, password:self.passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("ActiveChallengeViewController") as! ActiveChallengeViewController
                self.showViewController(vc, sender: self)
                vc.username = user?.username
                print("vc.username: \(vc.username)")
                print("nameTextField: \(self.nameTextField.text)")
                print("Current User: \(PFUser.currentUser())")
                
                // self.performSegueWithIdentifier("logInSegue", sender: nil)
            } else {
                // The login failed. Check error to see why.
            }
        }
    }
    
    
    @IBAction func onSignUp(sender: UIButton) {
        let user = PFUser()
        user.username = self.nameTextField.text
        user.password = self.passwordTextField.text
        
        //        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        //        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                self.errorLabel.text = errorString as? String
                // Show the errorString and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                let storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("CreateNewChallengeViewController") as! CreateNewChallengeViewController
                self.showViewController(vc, sender: self)
                print("Current User: \(PFUser.currentUser())")

            }
        }
    }
    
    @IBAction func loginWithFB(sender: UIButton) {
        PFFacebookUtils.logInInBackgroundWithReadPermissions(nil) {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                } else {
                    print("User logged in through Facebook!")
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
        }
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
