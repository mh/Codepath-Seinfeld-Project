//
//  CreateNewChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/15/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class CreateNewChallengeViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // activityTableView.

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func navigateToHome(sender: AnyObject) {
        let createStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let createController = createStoryboard.instantiateViewControllerWithIdentifier("ActiveChallengeViewController") as UIViewController
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
