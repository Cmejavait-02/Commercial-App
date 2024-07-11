//
//  ViewController.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 25/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func RegisterBtnTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let registrationViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
                // Push the new view controller onto the navigation stack
                DispatchQueue.main.async {
                            self.navigationController?.pushViewController(registrationViewController, animated: true)
                        }
            } else {
                // Handle the case where the view controller could not be instantiated
                print("Could not instantiate view controller with identifier 'RegistrationViewController'")
            }
    }
    
    @IBAction func LoginBtnTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                // Push the new view controller onto the navigation stack
                DispatchQueue.main.async {
                            self.navigationController?.pushViewController(LoginViewController, animated: true)
                        }
            } else {
                // Handle the case where the view controller could not be instantiated
                print("Could not instantiate view controller with identifier 'RegistrationViewController'")
            }
        
    }
    
}








