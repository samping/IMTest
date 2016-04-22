//
//  ViewController.swift
//  ui
//
//  Created by SAE on 16/2/23.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

class LoginController: UIViewController,UITextFieldDelegate  {

    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    //    var String[] = ["",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        account.delegate = self
        password.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createAccount(){
        //add your code
//        print("account : "+account.text!)
          self.result.text = ""
        AVUser.logInWithMobilePhoneNumberInBackground(account.text!, password: self.password.text!) { (user, error) -> Void in
            if (user != nil) {
              print("登录成功")
                self.loading.stopAnimating()
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                NSNotificationCenter.defaultCenter().postNotificationName("LoginCompletionNotification", object: nil)
               })
            }else{
                print(error)
                self.result.text = "登录不成功"
                self.loading.stopAnimating()
            }
        }
        loading.startAnimating()
    }
    
    
    @IBAction func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        //sheft your view up for input something if you need
        if textField == password {
            scroll.setContentOffset(CGPointMake(0, 40), animated: true)
        }
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == password {
            scroll.setContentOffset(CGPointMake(0, 0), animated: true)
        }
        return true
    }
}

