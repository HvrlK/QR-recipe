//
//  PatientTableViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class PatientTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var isDoctor = false
    var patient: Patients?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var medicalIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        if !isDoctor {
            barButton.title = NSLocalizedString("Log Out", comment: "Exit from account")
        }
        if let patient = patient {
            nameLabel.text = patient.name + " " + patient.surname
            dateLabel.text = patient.birthDate
            medicalIDLabel.text = String(patient.medicalID)
        }
    }
    
    // MARK: Actions
    
    @IBAction func barButtonTapped() {
        if isDoctor {
            dismiss(animated: true, completion: nil)
        } else {
            showLogOutAlert(self)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return isDoctor ? 3 : 2
        } else {
            return isDoctor ? 2 : 1
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewRecipe" {
            if let showAddMedicinesTableViewController = segue.destination as? ShowAddMedicinesTableViewController {
                showAddMedicinesTableViewController.isAdding = true
                showAddMedicinesTableViewController.patient = patient
            }
        }
        if segue.identifier == "ShowRecipe" {
            if let showAddMedicinesTableViewController = segue.destination as? ShowAddMedicinesTableViewController {
                showAddMedicinesTableViewController.patient = patient
            }
        }
    }

}
