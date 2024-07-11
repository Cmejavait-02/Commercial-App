//
//  RegisterViewController.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 25/06/24.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController:UIViewController {
    
    
    
    @IBOutlet weak var UserTf: UITextField!
    
    @IBOutlet weak var EmailTf: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    
    override func viewDidLoad() {
        print("jhvbhj")
        navigationController?.title = "e-Shop"

    }
    
    
    
    
    @IBAction func RegisterBtnTapped(_ sender: UIButton) {
        if let email = EmailTf.text,let password = PasswordTF.text,let username = UserTf.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                        // Show an alert with the error message
                        let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        DispatchQueue.main.async {
                            self.present(alert, animated: true, completion: nil)
                        }
                        print(e.localizedDescription)
                        return
                    }
                    
                    // Update the user's profile with the username
                    if let user = authResult?.user {
                        let changeRequest = user.createProfileChangeRequest()
                        changeRequest.displayName = username
                        changeRequest.commitChanges { error in
                            if let e = error {
                                // Show an alert with the error message
                                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                DispatchQueue.main.async {
                                    self.present(alert, animated: true, completion: nil)
                                }
                                print(e.localizedDescription)
                                return
                            }
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                if let ShopViewController = storyboard.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController {
                                    // Push the new view controller onto the navigation stack
                                    DispatchQueue.main.async {
                                                self.navigationController?.pushViewController(ShopViewController, animated: true)
                                            }
                                } else {
                                    // Handle the case where the view controller could not be instantiated
                                    print("Could not instantiate view controller with identifier 'ShopViewController'")
                                }
                            }
                        }
                    }
                }
            }
        }
     
    
    
    

