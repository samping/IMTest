//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by SAE on 16/4/19.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.connectServer({ () -> Void in
//            print("连接成功2")
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            self.refreshConversationTableViewIfNeeded()
        })
        // Do any additional setup after loading the view.
    }

    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        let conCV = RCConversationViewController()
        conCV.targetId = model.targetId
        conCV.userName = model.conversationTitle
        conCV.conversationType = .ConversationType_PRIVATE
        conCV.title = model.conversationTitle
        self.navigationController?.pushViewController(conCV, animated: true)
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        self.tabBarController?.tabBar.hidden = true
    }
    

}
