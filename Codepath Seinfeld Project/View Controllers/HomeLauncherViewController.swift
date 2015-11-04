//
//  HomeLauncherViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class HomeLauncherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func navigateToCreateScreen(sender: AnyObject) {
        
        let createStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        let createController = createStoryboard.instantiateViewControllerWithIdentifier("CreateNewChallengeViewController") as UIViewController
        self.presentViewController(createController, animated: true, completion: nil)

    }
    
    @IBAction func navigateToSignUp(sender: AnyObject) {
        let signinStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        let signinController = signinStoryboard.instantiateViewControllerWithIdentifier("CreateNewChallengeViewController") as UIViewController
        self.presentViewController(signinController, animated: true, completion: nil)
        
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
