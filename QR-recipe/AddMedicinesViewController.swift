//
//  AddMedicinesViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/11/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class AddMedicinesViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Properties
    
    var medicines = ["med", "med 2"]
    var selectedMedicines: String?
    var instruction: String?
    
    // MARK: - Outlets
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        textView.delegate = self
        updateDoneButton()
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        selectedMedicines = medicines[tableView.indexPathForSelectedRow!.row]
        instruction = textView.text
        performSegue(withIdentifier: "AddMedicines", sender: sender)
    }
    
    func updateDoneButton() {
        if textView.text != "" && tableView.indexPathForSelectedRow != nil {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateDoneButton()
    }
    
}

// MARK: - Extensions

extension AddMedicinesViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}

extension AddMedicinesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicinesListCell", for: indexPath)
        cell.textLabel?.text = medicines[indexPath.row]
        return cell
    }
    
}

extension AddMedicinesViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        updateDoneButton()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
