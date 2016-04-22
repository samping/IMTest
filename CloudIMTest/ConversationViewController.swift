//
//  ConversationViewController.swift
//  CloudIMTest
//
//  Created by SAE on 16/4/19.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController ,RCIMReceiveMessageDelegate{

    var currentUser :RCUserInfo!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     RCIM.sharedRCIM().receiveMessageDelegate = self
        refreshUI()
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "getUserInfo:", name:"NotificationIdentifier", object: nil)
               // Do any additional setup after loading the view.
    }

    func refreshUI(){
        let user = AVUser.currentUser()
        if(user != nil){
            currentUser =  RCIMClient.sharedRCIMClient().currentUserInfo
            self.targetId = "d"
            self.userName = currentUser.name
            
            self.conversationType = .ConversationType_PRIVATE
            self.title = self.userName
            self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)

        }
        
    }
    
    func onRCIMReceiveMessage(message: RCMessage!, left: Int32) {
        print(message)
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
