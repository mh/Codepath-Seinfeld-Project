//
//  SigninConfirmViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4
import AFNetworking

class SigninConfirmViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictureRequest = FBSDKGraphRequest(graphPath: "me/picture?type=large&redirect=false", parameters: nil)
        pictureRequest.startWithCompletionHandler({
            (connection, result, error: NSError!) -> Void in
            if error == nil {
                print("\(result)")
                let urlString = result.valueForKeyPath("data.url") as! String
                let url = NSURL(string: urlString)!
                self.profileImageView.setImageWithURL(url)
            } else {
                print("\(error)")
            }
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func navigateToHomeScreen(sender: AnyObject) {
        
        let createStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        let createController = createStoryboard.instantiateViewControllerWithIdentifier("CreateNewChallengeViewController") as UIViewController
        self.presentViewController(createController, animated: true, completion: nil)
        
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
