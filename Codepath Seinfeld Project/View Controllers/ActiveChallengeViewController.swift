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
    
    // Define the dictionary
    var days: [String] = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"] // [NSDictionary]!
    
    // Outlets here
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomSection: UIView!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var challengeTitle: UILabel!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Username: \(username)")
        
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
        circularProgressView.animateToAngle(144, duration: 1, completion: nil)
        
        // Load data from Parse
       /* let query = PFQuery(className: "Challenge")
        query.whereKey ("username", equalTo: username!)
        query.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            print(objects)
        } */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return days.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.dayCardTitle.text = self.days[indexPath.row]
      //  let curr = indexPath.row % 5  + 1
      //  let imgName = "pin\(curr).jpg"
       // cell.dayCardImage.image = UIImage(named: imgName)
        
        if (challengeImage != nil) {
            cell.dayCardXImage.image = challengeImage
        }
        
        return cell
    }
    
    @IBAction func onSettingsTap(sender: UIButton) {
        
        
        let optionMenu = UIAlertController(title: nil, message: "Select Option", preferredStyle: .ActionSheet)
        
        
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
    
    
    
    @IBAction func onHabitSettingsTap(sender: AnyObject) {
        var storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        var vc = storyboard.instantiateViewControllerWithIdentifier("NotificationSettingsViewController") as! NotificationSettingsViewController
        self.showViewController(vc, sender: self)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Segue ID: \(segue.identifier)")
        print("Sender: \(sender)")
        
        if(segue.identifier == "detail"){
            let cell = sender as! CollectionViewCell
            let indexPath = collectionView?.indexPathForCell(cell)
            let destinationVC = segue.destinationViewController as! ChallengeHistoryViewController
            
            print (cell.dayCardTitle.text)
            print("View Controller: \(destinationVC)")
            
            // send the data to the next view controller
            destinationVC.dayCardTitle = self.days[indexPath!.row]

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
