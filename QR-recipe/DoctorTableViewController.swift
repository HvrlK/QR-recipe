//
//  DoctorTableViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/5/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class DoctorTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var patients = ["Havruliuk Vitalii", "Babenko Andrew"]
    var searchPatients: [String] = []
    var isSearching = false
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
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
            patientCell.dateLabel.text = "2018"
        }
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Action
    
    @IBAction func logOut() {
        let alert = UIAlertController(title: NSLocalizedString("Are you sure?", comment: "LogOut - title"), message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(
            title: NSLocalizedString("Log Out", comment: "LogOut - exit"),
            style: .destructive,
            handler: { _ in
                //FIXME: write a logic
            })
        let cancelAction = UIAlertAction(
            title: NSLocalizedString("Cancel", comment: "LogOut - cancel"),
            style: .cancel,
            handler: nil
        )
        alert.addAction(logOutAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
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
