//
//  ViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/4/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    //FIXME: add data model
    var doctorAccounts = ["doctor"]
    var patientAccounts = ["patient"]
    
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
        passwordTextField.text?.removeAll()
        usernameTextField.becomeFirstResponder()
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
    //FIXME: check password
    @IBAction func loginButtonTapped() {
        if doctorAccounts.contains(usernameTextField.text!) {
            if let doctorNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "DoctorNavigationController") as? UINavigationController, let doctorTableViewController = doctorNavigationController.topViewController as? DoctorTableViewController {
                doctorTableViewController.doctor = "Doc"
                present(doctorNavigationController, animated: true, completion: nil)
            }
        } else if patientAccounts.contains(usernameTextField.text!) {
            if let patientNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "PatientNavigationController") as? UINavigationController, let patientTableViewController = patientNavigationController.topViewController as? PatientTableViewController {
                patientTableViewController.patient = "Hvrlk"
                present(patientNavigationController, animated: true, completion: nil)
            }
        } else {
            presentIncorrectDataAlert()
        }
    }

}

// MARK: - Extensions

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
