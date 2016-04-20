//
//  ConversationViewController.swift
//  CloudIMTest
//
//  Created by SAE on 16/4/19.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    var currentUser :RCUserInfo!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentUser =  RCIMClient.sharedRCIMClient().currentUserInfo
        self.targetId = "huang"
        self.userName = "ping"
        
        self.conversationType = .ConversationType_PRIVATE
        self.title = self.userName
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)

//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "getUserInfo:", name:"NotificationIdentifier", object: nil)
               // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserInfo(notification:NSNotification){
        
        currentUser =  RCIMClient.sharedRCIMClient().currentUserInfo
        self.targetId = currentUser.userId
        self.userName = currentUser.name
        
        self.conversationType = .ConversationType_PRIVATE
        self.title = self.userName
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)
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
