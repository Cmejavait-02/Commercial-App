//
//  LoginViewController.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 25/06/24.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var EmailTf: UITextField!
    
    
    @IBOutlet weak var PasswordTf: UITextField!
    
    
    
    
    override func viewDidLayoutSubviews() {
        navigationController?.toolbar.backgroundColor = .blue

    }
    
    override func viewDidLoad() {
        print("jhvbhj")
    }
  
    
    
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        if let email = EmailTf.text,let password = PasswordTf.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in guard let strongSelf = self else { return }
                if let e = error {
                    let alert = UIAlertController(title: "Error", message: "\(e.localizedDescription)", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           DispatchQueue.main.async {
                               self?.present(alert, animated: true, completion: nil)
                           }
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        if let ShopViewController = storyboard.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController {
                            // Push the new view controller onto the navigation stack
                            DispatchQueue.main.async {
                                self?.navigationController?.pushViewController(ShopViewController, animated: true)
                                    }
                        } else {
                            // Handle the case where the view controller could not be instantiated
                            print("Could not instantiate view controller with identifier 'RegistrationViewController'")
                        }

                }
            }
        }
    }
    
}
