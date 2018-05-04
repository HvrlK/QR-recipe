//
//  ViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/4/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.layer.cornerRadius = 8
        updateLoginButton()
    }
    
    func updateLoginButton() {
        if usernameTextField.text != "" && passwordTextField.text != "" {
            loginButton.isEnabled = true
            UIView.animate(withDuration: 0.3) {
                self.loginButton.alpha = 1
            }
        } else {
            loginButton.isEnabled = false
            UIView.animate(withDuration: 0.3) {
                self.loginButton.alpha = 0.5
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func forgotPassword() {
        let alert = UIAlertController(
            title: NSLocalizedString("Don't worry!", comment: "Forgot password - title"),
            message: NSLocalizedString("You can ask it in the register.", comment: "Forgot password - message"),
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: NSLocalizedString("Close", comment: "Forgot password - close"),
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

// MARK: - Extensions

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateLoginButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
