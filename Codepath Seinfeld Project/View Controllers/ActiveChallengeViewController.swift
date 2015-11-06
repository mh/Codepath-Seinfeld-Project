//
//  ActiveChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit
import Parse

let reuseIdentifier = "collCell"

class ActiveChallengeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // These items will be passed on segue
    var user: String?
    var challenge: String?
    var challengeImage: UIImage?

    var username: String?
    var challengeText: String?
    var challenges: [PFObject]!
    
    var daysIn = 1
    
    // Define the dictionary
    var days: [String] = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"] // [NSDictionary]!
    
    // Outlets here
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomSection: UIView!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var challengeTitle: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    @IBOutlet weak var numberOfDaysInLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Username: \(username)")
        
        challenges = []
        
        // TODO: Add conditionals for pulling the challenge title
        challengeTitle.text = challengeText
        
        // Set background colors
        self.view.backgroundColor = UIColor(red: 84/255, green: 41/255, blue: 127/255, alpha: 1)
        bottomSection.backgroundColor = UIColor(red: 175/255, green: 62/255, blue: 121/255, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 175/255, green: 62/255, blue: 121/255, alpha: 1)

        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.reloadData()

        // Do any additional setup after loading the view.

        circularProgressView.trackColor = UIColor(red: 84/255, green: 41/255, blue: 127/255, alpha: 1)
        circularProgressView.angle = 0
        
        let query = PFQuery(className: "Challenge")
    
        query.whereKey("user", equalTo: PFUser.currentUser()!)
        query.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            
            print("Objects: \(objects)")
            self.challenges = objects
            
            // select the last challenge they created
            let lastChallenge = objects?.last?.objectForKey("challengeText") as! String
            print("Challenge Name: \(lastChallenge)")
            self.challengeTitle.text = lastChallenge
            
            // lets find out what date this was created
            print("Created At \(objects?.last?.createdAt)")
            let date = objects?.last?.createdAt! as NSDate!
            print(date)
            
            // determine today
            let cal = NSCalendar.currentCalendar()
            let today = cal.startOfDayForDate(NSDate())
            
            // calculate how many days between signup date and today
            let diff = cal.components(NSCalendarUnit.Day,
                fromDate: date,
                toDate: today, options: [])
            
            // HACK: make this dynamically update it
            if (self.challengeImage == nil) {
                self.daysIn = diff.day

            } else {
                self.daysIn = diff.day + 1

            }
            
            let daysLeft = 30 - self.daysIn
            print("Days since challenge has begun \(self.daysIn)")
            
            // Update the labels in the view
            self.numberOfDaysLabel.text = String(daysLeft)
            
            if self.daysIn == 1 {
                self.numberOfDaysInLabel.text = "\(String(self.daysIn)) DAY IN"
            } else {
                self.numberOfDaysInLabel.text = "\(String(self.daysIn)) DAYS IN"
            }
            
            
            // Animate the progress bar
            
            
            let progressPercent: Double = (Double(self.daysIn)/30.0) * 360.0
            print(progressPercent)
            print((self.daysIn/30) * 360)
            print((Int(self.daysIn/30) * 360))
            
            self.circularProgressView.animateToAngle(Int(progressPercent), duration: 1, completion: nil)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return daysIn
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        
        return daysIn
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.dayCardTitle.text = self.days[indexPath.row]
      //  let curr = indexPath.row % 5  + 1
      //  let imgName = "pin\(curr).jpg"
       // cell.dayCardImage.image = UIImage(named: imgName)
        
        if (challengeImage != nil) {
            cell.dayCardXImage.image = challengeImage
        } else {
            // Hide the X
            cell.dayCardXImage.alpha = 0
        }
        
        
        return cell
    }
    
    @IBAction func onSettingsTap(sender: UIButton) {
        
        
        let optionMenu = UIAlertController(title: nil, message: "Select Option", preferredStyle: .ActionSheet)
        
        
        let habitAction = UIAlertAction(title: "Notifications Settings", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("notification")
            var storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
            var vc = storyboard.instantiateViewControllerWithIdentifier("NotificationSettingsViewController") as! NotificationSettingsViewController
            self.showViewController(vc, sender: self)
            
            //PFuser.logOutInBackground
        })
        
        let deleteAction = UIAlertAction(title: "Delete Goal", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("delete")
        })
        let saveAction = UIAlertAction(title: "Sign Out", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("sign out")
            var storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
            var vc = storyboard.instantiateViewControllerWithIdentifier("SigninViewController") as! SigninViewController
            self.showViewController(vc, sender: self)
        
            //PFuser.logOutInBackground
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("cancel")
        })
        
        
        optionMenu.addAction(habitAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
        
        
        //NOAH COMMENTED OUT TO USE ACTION SHEET INSTEAD
        /*
        var storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        var vc = storyboard.instantiateViewControllerWithIdentifier("SigninViewController") as! SigninViewController
        self.showViewController(vc, sender: self)
      */
    

    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Segue ID: \(segue.identifier)")
        print("Sender: \(sender)")
        
        if(segue.identifier == "detail"){
            
            if (self.challengeImage != nil) {
                // take them to detail view
                let cell = sender as! CollectionViewCell
                let indexPath = collectionView?.indexPathForCell(cell)
                let destinationVC = segue.destinationViewController as! ChallengeHistoryViewController
                
                print (cell.dayCardTitle.text)
                print("View Controller: \(destinationVC)")
                
                // send the data to the next view controller
                destinationVC.dayCardTitle = self.days[indexPath!.row]
                destinationVC.challengeImage = challengeImage
                
            } else {
                // Take them to Draw the X
                let createStoryboard = UIStoryboard(name: "Capture", bundle: nil)
                let createController = createStoryboard.instantiateViewControllerWithIdentifier("CompleteChallengeViewController") as UIViewController
                self.presentViewController(createController, animated: true, completion: nil)
            
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
