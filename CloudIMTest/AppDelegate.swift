//
//  AppDelegate.swift
//  CloudIMTest
//
//  Created by SAE on 16/4/19.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?


    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId{
            case "huang":
            userInfo.name = "小波"
            userInfo.portraitUri = "http://v1.qzone.cc/avatar/201303/18/19/58/51470171816fe315.jpg!200x200.jpg"
            case "xiaobo":
            userInfo.name = "小波"
            userInfo.portraitUri = "http://v1.qzone.cc/avatar/201303/18/19/58/51470171816fe315.jpg!200x200.jpg"
            case "xiaobo2":
            userInfo.name = "小波2"
            userInfo.portraitUri = "http://v1.qzone.cc/avatar/201303/18/19/58/51470171bf2cc086.jpg!200x200.jpg"
        default :
            print("nothing")
        }
        return completion(userInfo)
    }
    
    func connectServer(completion : ()->Void){
        
//        RCIM.sharedRCIM().userInfoDataSource = self
        
        //init appkey
        RCIM.sharedRCIM().initWithAppKey("8w7jv4qb7hpry")
        RCIM.sharedRCIM().connectWithToken("T9NsIUFoNUs22m4eddlafWm8Tws/8RnHtOD1EM9lb/xdO+HkCMBfmlOPPKDV8dnj5oDyuZ33uBE16qiar1tH7w==", success: { (_) -> Void in
            print("连接成功")
            
            RCIMClient.sharedRCIMClient().currentUserInfo = RCUserInfo(userId: "xiao", name: "xiaobo", portrait: "http://v1.qzone.cc/avatar/201303/18/19/58/51470171816fe315.jpg!200x200.jpg")
            NSNotificationCenter.defaultCenter().postNotificationName("NotificationIdentifier", object: nil)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
            
            }, error: { (_) -> Void in
                print("连接失败")
            }) { () -> Void in
                print("Token 错误去")
        }

    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //check Token who is saved
//        let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
               return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

