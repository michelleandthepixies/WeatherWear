//
//  SignInViewController.swift
//  WeatherWear
//
//  Created by Michelle Shu on 4/4/17.
//  Copyright © 2017 Matthew Lee. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    var currentUser: PFUser?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // check if the username or password is empty
    func isEmptyFields() -> Bool {
        if (self.userField.text == "" || self.passwordField.text == "") {
            let alert = UIAlertController(title: "WeatherWear", message: "Please fill in username/password 🤷‍♀️", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return true;
        }
        return false;
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        // check if the username or password is empty
        if (!self.isEmptyFields()){
        // create new user
        let newUser = PFUser()
        newUser.username = self.userField.text
        newUser.password = self.passwordField.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if (success) {
                print("Succeess")
                self.performSegue(withIdentifier: "homeSegue", sender: self.currentUser)
            } else {
                print(error?.localizedDescription as Any)
                let alert = UIAlertController(title: "WeatherWear", message: "The username is taken. 🤷‍♀️", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Try another one", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        }
        
        
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        // check if the username or password is empty
        if (!self.isEmptyFields()) {
        PFUser.logInWithUsername(inBackground: self.userField.text!, password: self.passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("Login Success!")
                self.currentUser = user
                
                self.performSegue(withIdentifier: "homeSegue", sender: self.currentUser)
            } else {
                
                // this logic should be improved;
                // i.e. it could fail due to multiple reasons. If it is incorrect password, username, this should be specified
                
                let alert = UIAlertController(title: "WeatherWear", message: "Login Failed 🤷‍♀️", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        }
        
    }
    

    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
