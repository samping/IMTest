//
//  ViewController.swift
//  ui
//
//  Created by SAE on 16/2/23.
//  Copyright © 2016年 SAE. All rights reserved.
//

import UIKit

class SignInController: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    

//    var String[] = ["",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        account.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createAccount(){
        
        self.result.text = ""
        
        //add your code
        if(self.password.text! != self.confirmPassword.text!){
            self.result.text = "密码不相等"

        }else{
//        User.sharedInstance.signIn(account.text!, password: self.password.text!) { (code, status) -> Void in
//            if(code == 1){
//                self.loading.stopAnimating()
//                self.dismissViewControllerAnimated(true, completion: { () -> Void in
//                    NSNotificationCenter.defaultCenter().postNotificationName("SignInCompletionNotification", object: nil)
//                })
//            }else{
//                self.result.text = "注册不成功"
//                self.loading.stopAnimating()
//                
//            }
//
//        }
        let new = AVUser()
            new.password = self.password.text!
            new.username = self.username.text!
            new.mobilePhoneNumber = self.account.text!
            new.signUpInBackgroundWithBlock({ (succeeded, error) -> Void in
                if succeeded {
                    print("注册成功")
                    self.loading.stopAnimating()
                    self.dismissViewControllerAnimated(true, completion: { () -> Void in
                        NSNotificationCenter.defaultCenter().postNotificationName("SignInCompletionNotification", object: nil)
                    })
                }else{
                    print(error)
                    self.result.text = "注册不成功"
                    self.loading.stopAnimating()
                }
            })

        loading.startAnimating()
        }
    }
    
    
    @IBAction func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField == password {
        scroll.setContentOffset(CGPointMake(0, 40), animated: true)
        }else if textField == confirmPassword {
            scroll.setContentOffset(CGPointMake(0, 80), animated: true)

        }
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
         scroll.setContentOffset(CGPointMake(0, 0), animated: true)
        return true
    }
  }

