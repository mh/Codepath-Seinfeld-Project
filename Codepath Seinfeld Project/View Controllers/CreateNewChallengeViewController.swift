//
//  CreateNewChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/15/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class CreateNewChallengeViewController: UIViewController {

    @IBOutlet weak var challengeInput: UITextField!

    @IBOutlet weak var demoGoalsImageView: UIImageView!

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let demoOriginalPosition = demoGoalsImageView.center
        
        delay(0.7) { () -> () in
            self.challengeInput.becomeFirstResponder()
        }
        
        UIView.animateWithDuration(55.0, delay: 0, options: [], animations: { () -> Void in
            let newCenter = CGPoint(x: demoOriginalPosition.x, y: demoOriginalPosition.y - (self.demoGoalsImageView.frame.size.height + 200))
            
            self.demoGoalsImageView.center = newCenter
            }) { (Bool) -> Void in
                //COMPLETTION
        }
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
