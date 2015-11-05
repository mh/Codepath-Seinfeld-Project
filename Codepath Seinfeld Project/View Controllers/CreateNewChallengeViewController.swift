//
//  CreateNewChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/15/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit
import Parse

class CreateNewChallengeViewController: UIViewController {

    @IBOutlet weak var challengeInput: UITextField!
    @IBOutlet weak var demoGoalsImageView: UIImageView!

    var challenges: [PFObject]!
    
    @IBOutlet weak var createChallengeNextButton: UIButton!
    
    @IBAction func didPressCreateChallengeButton(sender: AnyObject) {
        
        //NEXT BUTTON ACTION
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        createChallengeNextButton.alpha = 0
        
        var demoOriginalPosition = demoGoalsImageView.center
        
        delay(0.1) { () -> () in
            self.challengeInput.becomeFirstResponder()
        }
        self.challengeInput.becomeFirstResponder()
        
        if demoGoalsImageView.alpha == 1 {
            
            UIView.animateWithDuration(55.0, delay: 0, options: [], animations: { () -> Void in
                var newCenter = CGPoint(x: demoOriginalPosition.x, y: demoOriginalPosition.y - (self.demoGoalsImageView.frame.size.height + 200))
                
                self.demoGoalsImageView.center = newCenter
                }) { (Bool) -> Void in
                    //COMPLETTION
                    
            }
        }

        else {
                    }

        

        
    }
    @IBAction func didInputChallenge(sender: AnyObject) {
        

        if challengeInput.text?.utf16.count < 1 {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.demoGoalsImageView.alpha = 1
            })
        }
        else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.demoGoalsImageView.alpha = 0

            })
        }
        
    }

    override func viewDidLoad() {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func navigateToHome(sender: AnyObject) {
        
        // Set the storyboards that we will be transitioning to
        let createStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let createController = createStoryboard.instantiateViewControllerWithIdentifier("ActiveChallengeViewController") as! ActiveChallengeViewController
        
        // Send the challengeInput to the string "challenge" that was created on the ActiveViewController
        createController.challenge = self.challengeInput.text
        createController.user = "userNameHere"

        
        // Transition to the next view controller
        self.presentViewController(createController, animated: true, completion: nil)
        
        // Store the challenge
        let challenge = PFObject(className: "Challenge")
        
        challenge["challengeText"] = challengeInput.text
        challenge["userName"] = "userNameInfoHere" // Placeholder for user info
       // challenge.setObject(challengeInput.text!, forKey: "1")
        
        // Save the data
        challenge.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Challenge Info: \(challenge)")
            } else {
                print("Error: \(error?.description) ")
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
