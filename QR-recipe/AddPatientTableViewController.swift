//
//  AddPatientTableViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class AddPatientTableViewController: DoctorTableViewController {
    
    // MARK: - Properties
    
    var selectedPatient: String?
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        patients = ["Illenok Marina", "Plahtiy Bogdan"]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath)
        if let patientCell = cell as? PatientTableViewCell {
            let patient = isSearching ? searchPatients[indexPath.row] : patients[indexPath.row]
            patientCell.nameLabel.text = patient
            patientCell.informationLabel.text = "392293"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPatient = patients[indexPath.row]
        performSegue(withIdentifier: "AddPatient", sender: indexPath)
    }

}