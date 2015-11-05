//
//  NotificationSettingsViewController.swift
//  Codepath Seinfeld Project
//
//  Created by Noah Batterson on 11/2/15.
//  Copyright © 2015 matt hunter. All rights reserved.
//

import UIKit

class NotificationSettingsViewController: UIViewController {
    
    @IBOutlet weak var morningReminderSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onMorningReminderSwitch(sender: UIButton) {
        if morningReminderSwitch.on {
           /*
            let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)
            UIApplication.sharedApplication().registerForRemoteNotifications()
            print("switch on")
            
            
            var localNotification:UILocalNotification = UILocalNotification()
            localNotification.alertAction = "30"
            localNotification.alertBody = "Reminder: Call Mom"
            localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.category = "invite"
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)*/
        } else {
            print("switch off")
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
