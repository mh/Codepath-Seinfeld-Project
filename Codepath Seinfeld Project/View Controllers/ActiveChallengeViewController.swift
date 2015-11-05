//
//  ActiveChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

let reuseIdentifier = "collCell"

class ActiveChallengeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // These items will be passed on segue
    var user: String?
    var challenge: String?
    
    // Define the dictionary
    var days: [String] = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"] // [NSDictionary]!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomSection: UIView!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var challengeTitle: UILabel!
    
    
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add conditionals for pulling the challenge title
        challengeTitle.text = challenge
        
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
        
        return cell
    }
    

    @IBAction func onSettingsTap(sender: UIButton) {
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        var vc = storyboard.instantiateViewControllerWithIdentifier("SigninViewController") as! SigninViewController
        self.showViewController(vc, sender: self)
        
//        presentViewController(SigninViewController, animated: true, completion: nil)
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
