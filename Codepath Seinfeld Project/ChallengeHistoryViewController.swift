//
//  ChallengeHistoryViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class ChallengeHistoryViewController: UIViewController {

    var currImage: UIImage?
    var dayCardTitle: String?
    var challengeImage: UIImage?

    @IBOutlet weak var challXcardImage: UIImageView!
    @IBOutlet weak var dayText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 175/255, green: 62/255, blue: 121/255, alpha: 0.3)
        
        dayText.text = dayCardTitle
        challXcardImage.image = challengeImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCelebrationAnimation(sender: AnyObject) {
        
        let createStoryboard = UIStoryboard(name: "Capture", bundle: nil)
        let createController = createStoryboard.instantiateViewControllerWithIdentifier("ShareChallengeViewController") as UIViewController
        self.presentViewController(createController, animated: true, completion: nil)
    }

    @IBAction func dissmissAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
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
