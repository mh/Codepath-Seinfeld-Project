//
//  ShareChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class ShareChallengeViewController: UIViewController {
    @IBOutlet weak var trophyImage: UIImageView!
    @IBOutlet weak var starImage1: UIImageView!
    @IBOutlet weak var starImage2: UIImageView!
    @IBOutlet weak var starImage3: UIImageView!
    @IBOutlet weak var starImage4: UIImageView!
    @IBOutlet weak var starImage5: UIImageView!
    @IBOutlet weak var starImage6: UIImageView!
    @IBOutlet weak var starImage7: UIImageView!
    @IBOutlet weak var starImage8: UIImageView!
    @IBOutlet weak var congratsLabel: UIView!
    @IBOutlet weak var newGoalButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
//TROPHY START
        trophyImage.transform = CGAffineTransformMakeScale(3, 3)
        trophyImage.alpha = 0
        
        UIView.animateWithDuration(0.8, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
            self.trophyImage.transform = CGAffineTransformMakeScale(1, 1)
            self.trophyImage.alpha = 1
            }) { (Bool) -> Void in
                //
        }
//TROPHY END
        
//STARS START
        //1 START
        starImage1.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage1.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage1.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
            self.starImage1.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage1.alpha = 1
            self.starImage1.center = CGPoint(x: 84+12, y: 401+12)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.6, delay: 0.6, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage1.transform = CGAffineTransformMakeScale(0.8, 0.8)
                    }, completion: nil)
        }
        //1 END
        //2 START
        starImage2.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage2.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage2.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: { () -> Void in
            self.starImage2.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage2.alpha = 1
            self.starImage2.center = CGPoint(x: 108+6, y: 369+6)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.7, delay: 0.3, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage2.transform = CGAffineTransformMakeScale(0.6, 0.6)
                    }, completion: nil)
        }
        //2 END
        //3 START
        starImage3.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage3.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage3.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: [], animations: { () -> Void in
            self.starImage3.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage3.alpha = 1
            self.starImage3.center = CGPoint(x: 78+6, y: 195+6)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.6, delay: 0.2, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage3.transform = CGAffineTransformMakeScale(0.8, 0.8)
                    }, completion: nil)
        }
        //3 END
        //4 START
        starImage4.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage4.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage4.alpha = 0
        
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.starImage4.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage4.alpha = 1
            self.starImage4.center = CGPoint(x: 121+6, y: 178+6)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.7, delay: 0.3, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage4.transform = CGAffineTransformMakeScale(0.6, 0.6)
                    }, completion: nil)
        }
        //4 END
        //5 START
        starImage5.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage5.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage5.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.starImage5.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage5.alpha = 1
            self.starImage5.center = CGPoint(x: 281+12, y: 184+12)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.9, delay: 0.3, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage5.transform = CGAffineTransformMakeScale(0.5, 0.5)
                    }, completion: nil)
        }
        //5 END
        //6 START
        starImage6.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage6.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage6.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0.4, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.starImage6.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage6.alpha = 1
            self.starImage6.center = CGPoint(x: 281+6, y: 334+6)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.4, delay: 0.5, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage6.transform = CGAffineTransformMakeScale(0.8, 0.8)
                    }, completion: nil)
        }
        //6 END
        //7 START
        starImage7.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage7.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage7.alpha = 0
        
        UIView.animateWithDuration(0.6, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.starImage7.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage7.alpha = 1
            self.starImage7.center = CGPoint(x: 249+12, y: 368+12)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.7, delay: 0.2, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage7.transform = CGAffineTransformMakeScale(0.7, 0.7)
                    }, completion: nil)
        }
        //7 END
        //8 START
        starImage8.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage8.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage8.alpha = 0
        
        UIView.animateWithDuration(0.4, delay: 0.65, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            self.starImage8.transform = CGAffineTransformMakeScale(1, 1)
            self.starImage8.alpha = 1
            self.starImage8.center = CGPoint(x: 257+6, y: 419+6)
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.6, delay: 0.3, options: [.Autoreverse, .Repeat], animations: { () -> Void in
                    self.starImage8.transform = CGAffineTransformMakeScale(0.4, 0.4)
                    }, completion: nil)
        }
        //8 END

//STARS END
//CONGRATS START
        congratsLabel.transform = CGAffineTransformMakeScale(0.01, 0.01)
        congratsLabel.alpha = 0
        congratsLabel.center = CGPoint(x: view.center.x, y: -50)
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
            self.congratsLabel.transform = CGAffineTransformMakeScale(1, 1)
            self.congratsLabel.alpha = 1
            self.congratsLabel.center = CGPoint(x: self.view.center.x, y: 90)
            }) { (Bool) -> Void in
                //Completion
        }
//CONGRATS END
//NEWGOAL START
        newGoalButton.alpha = 0
        newGoalButton.center = CGPoint(x: view.center.x, y: 572)
        
        UIView.animateWithDuration(0.6, delay: 1.6, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
            self.newGoalButton.alpha = 1
            self.newGoalButton.center = CGPoint(x: self.view.center.x, y: 543)
            }) { (Bool) -> Void in
//                UIView.animateWithDuration(1.0, delay: 0.4, options: [.Autoreverse, .Repeat], animations: { () -> Void in
//                    self.newGoalButton.center = CGPoint(x: self.view.center.x, y: 541)
//                    }, completion: nil)
        }
//NEWGOAL END
//SHARE START
        shareButton.alpha = 0
        shareButton.center = CGPoint(x: view.center.x, y: 696)
        
        UIView.animateWithDuration(0.2, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: [], animations: { () -> Void in
            self.shareButton.alpha = 1
            self.shareButton.center = CGPoint(x: self.view.center.x, y: 638)
            }) { (Bool) -> Void in
                //Completion
        }
//SHARE END

        
    }
    
    override func viewDidDisappear(animated: Bool) {
        //REST ALPHA AND STARTING POSITION
        trophyImage.transform = CGAffineTransformMakeScale(3, 3)
        trophyImage.alpha = 0
        starImage1.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage1.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage1.alpha = 0
        starImage2.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage2.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage2.alpha = 0
        starImage3.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage3.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage3.alpha = 0
        starImage4.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage4.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage4.alpha = 0
        starImage5.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage5.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage5.alpha = 0
        starImage6.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage6.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage6.alpha = 0
        starImage7.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage7.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage7.alpha = 0
        starImage8.transform = CGAffineTransformMakeScale(0.01, 0.01)
        starImage8.center = CGPoint(x: view.center.x, y: view.center.y)
        starImage8.alpha = 0
        congratsLabel.transform = CGAffineTransformMakeScale(0.01, 0.01)
        congratsLabel.alpha = 0
        congratsLabel.center = CGPoint(x: view.center.x, y: -50)
        newGoalButton.alpha = 0
        newGoalButton.center = CGPoint(x: view.center.x, y: 572)
        shareButton.alpha = 0
        shareButton.center = CGPoint(x: view.center.x, y: 696)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressNewGoalBtn(sender: AnyObject) {
        // TRANSITION TO CREATE CHALLENGE VC
        print("pressed new goal")
        // self.dismissViewControllerAnimated(true, completion: {});

        let storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("CreateNewChallengeViewController") as! CreateNewChallengeViewController
        self.showViewController(vc, sender: self)
    }
    @IBAction func didPressShareButton(sender: UIButton) {
        // SHOW SHARE OPTIONS?
        var shareString = "I did 30 Days of my Goal!"
        
        var objectsToShare = [shareString]
        
        let activityViewController      = UIActivityViewController(activityItems: objectsToShare as [AnyObject], applicationActivities: nil)
        
        presentViewController(activityViewController, animated: true, completion: nil)
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
