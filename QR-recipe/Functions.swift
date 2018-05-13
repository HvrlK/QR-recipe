//
//  Functions.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/8/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit
import CoreData

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

func accountForDoctor(_ doctor: Doctors) -> UINavigationController? {
    if let doctorNavigationController = storyboard.instantiateViewController(withIdentifier: "DoctorNavigationController") as? UINavigationController, let doctorTableViewController = doctorNavigationController.topViewController as? DoctorTableViewController {
        doctorTableViewController.doctor = doctor
        return doctorNavigationController
    }
    return nil
}

func accountForPatient(_ patient: Patients) -> UINavigationController? {
    if let patientNavigationController = storyboard.instantiateViewController(withIdentifier: "PatientNavigationController") as? UINavigationController, let patientTableViewController = patientNavigationController.topViewController as? PatientTableViewController {
        patientTableViewController.patient = patient
        return patientNavigationController
    }
    return nil
}

func context() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.managedObjectContext
    return context
}

//FIXME: alert for error
func saveContext(_ context: NSManagedObjectContext) {
    do {
        try context.save()
    } catch {
        fatalError("dont save")
    }
}

let sortByName = NSSortDescriptor(key: "name", ascending: true)
let sortByLogin = NSSortDescriptor(key: "login", ascending: true)

func fetchRequestForDoctorAccounts(_ context: NSManagedObjectContext) -> [DoctorAccounts] {
    let fetchRequest = NSFetchRequest<DoctorAccounts>()
    let entity = DoctorAccounts.entity()
    fetchRequest.entity = entity
    fetchRequest.sortDescriptors = [sortByLogin]
    do {
        return try context.fetch(fetchRequest)
    } catch {
        fatalError("dont fetch")
    }
}

func fetchRequestForPatientAccounts(_ context: NSManagedObjectContext) -> [PatientAccounts] {
    let fetchRequest = NSFetchRequest<PatientAccounts>()
    let entity = PatientAccounts.entity()
    fetchRequest.entity = entity
    fetchRequest.sortDescriptors = [sortByLogin]
    do {
        return try context.fetch(fetchRequest)
    } catch {
        fatalError("dont fetch")
    }
}

func fetchRequestForPatients(_ context: NSManagedObjectContext) -> [Patients] {
    let fetchRequest = NSFetchRequest<Patients>()
    let entity = Patients.entity()
    fetchRequest.entity = entity
    fetchRequest.sortDescriptors = [sortByName]
    do {
        return try context.fetch(fetchRequest)
    } catch {
        fatalError("dont fetch")
    }
}

func fetchRequestForDoctors(_ context: NSManagedObjectContext) -> [Doctors] {
    let fetchRequest = NSFetchRequest<Doctors>()
    let entity = Doctors.entity()
    fetchRequest.entity = entity
    fetchRequest.sortDescriptors = [sortByName]
    do {
        return try context.fetch(fetchRequest)
    } catch {
        fatalError("dont fetch")
    }
}

func fetchRequestForMedicines(_ context: NSManagedObjectContext) -> [Medicines] {
    let fetchRequest = NSFetchRequest<Medicines>()
    let entity = Medicines.entity()
    fetchRequest.entity = entity
    fetchRequest.sortDescriptors = [sortByName]
    do {
        return try context.fetch(fetchRequest)
    } catch {
        fatalError("dont fetch")
    }
}

