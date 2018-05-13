//
//  ViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/4/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit
import CoreData

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
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginButton.layer.cornerRadius = 8
        updateLoginButton()
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange() {
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
    
    func presentIncorrectDataAlert() {
        usernameTextField.text?.removeAll()
        passwordTextField.becomeFirstResponder()
        let alert = UIAlertController(
            title: NSLocalizedString("Incorrect login or password", comment: "Incorrect data - title"),
            message: NSLocalizedString("Please, try again.", comment: "Incorrect data - message"),
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: NSLocalizedString("OK", comment: "Incorrect data - OK"),
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func savePassword() {
        let defaults = UserDefaults.standard
        defaults.set(String(describing: usernameTextField.text!), forKey: "login")
        defaults.set(String(describing: passwordTextField.text!), forKey: "password")
    }
    
    // MARK: Actions
    
    @IBAction func forgotPassword() {
        let alert = UIAlertController(
            title: NSLocalizedString("Don't worry!", comment: "Forgot password - title"),
            message: NSLocalizedString("Call the number 097 692 42 09.", comment: "Forgot password - message"),
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

    @IBAction func loginButtonTapped() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        if usernameTextField.text!.contains("@") {
            let doctorAccounts = fetchRequestForDoctorAccounts(context)
            for account in doctorAccounts {
                if account.login == usernameTextField.text!, account.password == passwordTextField.text! {
                    //FIXME: doctorID
                    if let doctorNavigationController = accountForDoctor("doc") {
                        savePassword()
                        appDelegate.window?.rootViewController = doctorNavigationController
                    }
                } else {
                    presentIncorrectDataAlert()
                }
            }
        } else {
            let patientAccounts = fetchRequestForPatientAccounts(context)
            for account in patientAccounts {
                if account.login == usernameTextField.text!, account.password == passwordTextField.text! {
                    //FIXME: patientID
                    if let patientNavigationController = accountForPatient("Hvrlk") {
                        savePassword()
                        appDelegate.window?.rootViewController = patientNavigationController
                    }
                } else {
                    presentIncorrectDataAlert()
                }
            }
        }
    }

}

// MARK: - Extensions

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        }
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            if loginButton.isEnabled {
                loginButtonTapped()
            }
        }
        return true
    }
    
}
