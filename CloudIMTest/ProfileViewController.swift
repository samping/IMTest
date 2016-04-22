//
//  ProfileViewController.swift
//  health
//
//  Created by SAE on 16/3/3.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var log: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var isLogin : Bool?
    
    var user : AVUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshInitUI()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginCompletion:", name: "LoginCompletionNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "signInCompletion:", name: "SignInCompletionNotification", object: nil)

               // Do any additional setup after loading the view.
    }
    
    func refreshInitUI(){
        user = AVUser.currentUser()
        if(user != nil){
            accountName.text = user?.username
            log.setTitle("注销", forState: UIControlState.Normal)
            isLogin = true
        }else{
            accountName.text = "请登录"
            log.setTitle("登录", forState: UIControlState.Normal)
            isLogin = false
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logInOut(){
        if(isLogin!){
            //goto logout
            loading.startAnimating()
            AVUser.logOut()
            self.accountName.text = "请登录"
            self.log.setTitle("登录", forState: UIControlState.Normal)
            self.isLogin = false

        }else{
            self.performSegueWithIdentifier("login", sender: self)
        }
    }
    
    func loginCompletion(notification:NSNotification){
        refreshInitUI()
    }
    func signInCompletion(notification:NSNotification){
       self.performSegueWithIdentifier("login", sender: self)
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
