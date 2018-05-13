//
//  DoctorTableViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/5/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class DoctorTableViewController: UITableViewController, UISearchControllerDelegate {
    
    // MARK: - Properties
    
    var patients = ["Havruliuk Vitalii", "Babenko Andrew"]
    var searchPatients: [String] = []
    var isSearching = false
    var doctor: String?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = doctor
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchPatients.count
        }
        return patients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath)
        if let patientCell = cell as? PatientTableViewCell {
            let patient = isSearching ? searchPatients[indexPath.row] : patients[indexPath.row]
            patientCell.nameLabel.text = patient
            patientCell.medicalIDLabel.text = "204343"
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //FIXME: add database logic
            patients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPatient" {
            guard let patientNavigationController = segue.destination as? UINavigationController else { return }
            if let cell = sender as? PatientTableViewCell, let indexPath = tableView.indexPath(for: cell), let patientTableViewController = patientNavigationController.topViewController as? PatientTableViewController {
                patientTableViewController.patient = patients[indexPath.row]
                patientTableViewController.isDoctor = true
            }
        }
    }
    
    @IBAction func unwindFromAddPatient(unwideSegue: UIStoryboardSegue) {
        guard let addPatientTableViewController = unwideSegue.source as? AddPatientTableViewController, let patient = addPatientTableViewController.selectedPatient else { return }
        patients.append(patient)
        tableView.reloadData()
    }
    
    // MARK: Action
    
    @IBAction func logOut() {
        showLogOutAlert(self)
    }

}

// MARK: - Extensions

extension DoctorTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
        }
    }
    //FIXME: add data supporting (medID)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchPatients = patients
        } else {
            searchPatients = patients.filter { patient -> Bool in
                let searchWords = searchText.components(separatedBy: " ").map { $0 }
                for word in searchWords {
                    if patient.lowercased().range(of: word.lowercased()) == nil, word != "" {
                        return false
                    }
                }
                return true
            }
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        isSearching = true
        searchPatients = patients
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        searchBar.text?.removeAll()
        isSearching = false
        tableView.reloadData()
    }
    
}
