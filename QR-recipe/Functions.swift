//
//  Functions.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/8/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

let storyboard = UIStoryboard(name: "Main", bundle: nil)

func showLogOutAlert(_ viewController: UIViewController) {
    let defaults = UserDefaults.standard
    let alert = UIAlertController(title: NSLocalizedString("Are you sure?", comment: "LogOut - title"), message: nil, preferredStyle: .alert)
    let logOutAction = UIAlertAction(
        title: NSLocalizedString("Log Out", comment: "LogOut - exit"),
        style: .destructive,
        handler: { _ in
            defaults.set(nil, forKey: "login")
            defaults.set(nil, forKey: "password")
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            viewController.present(loginViewController, animated: true, completion: nil)
    })
    let cancelAction = UIAlertAction(
        title: NSLocalizedString("Cancel", comment: "LogOut - cancel"),
        style: .cancel,
        handler: nil
    )
    alert.addAction(logOutAction)
    alert.addAction(cancelAction)
    viewController.present(alert, animated: true, completion: nil)
}

func accountForDoctor(_ doctor: String) -> UINavigationController? {
    if let doctorNavigationController = storyboard.instantiateViewController(withIdentifier: "DoctorNavigationController") as? UINavigationController, let doctorTableViewController = doctorNavigationController.topViewController as? DoctorTableViewController {
        doctorTableViewController.doctor = doctor
        return doctorNavigationController
    }
    return nil
}

func accountForPatient(_ patient: String) -> UINavigationController? {
    if let patientNavigationController = storyboard.instantiateViewController(withIdentifier: "PatientNavigationController") as? UINavigationController, let patientTableViewController = patientNavigationController.topViewController as? PatientTableViewController {
        patientTableViewController.patient = patient
        return patientNavigationController
    }
    return nil
}
