//
//  ActiveChallengeViewController.swift
//  Codepath Seinfeld Project
//
//  Created by matt hunter on 10/20/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class ActiveChallengeViewController: UIViewController {

    @IBOutlet weak var bottomSection: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 84/255, green: 41/255, blue: 127/255, alpha: 1)
        
        bottomSection.backgroundColor = UIColor(red: 175/255, green: 62/255, blue: 121/255, alpha: 1)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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