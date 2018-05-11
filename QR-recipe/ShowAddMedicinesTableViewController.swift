//
//  ShowMedicinesTableViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/10/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class ShowAddMedicinesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var medicines = ["med 1", "med 2"]
    var meddescription = ["description 1", "description 2"]
    var isAdding = false
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        var barButtonItem: UIBarButtonItem
        if isAdding {
            barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMedecines))
        } else {
            barButtonItem = UIBarButtonItem(title: "QR-code", style: .plain, target: self, action: #selector(showQRCode))
        }
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func showQRCode() {
        if let QRCodeViewController = storyboard?.instantiateViewController(withIdentifier: "QRCodeViewController") as? QRcodeViewController {
            let medicinesForQRCode = medicines.joined(separator: "\n")
            let data = medicinesForQRCode.data(using: .utf8, allowLossyConversion: false)
            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 10, y: 10)
                if let output = filter.outputImage?.transformed(by: transform) {
                    QRCodeViewController.image = UIImage(ciImage: output)
                }
            }
            present(QRCodeViewController, animated: true, completion: nil)
        }
    }
    
    @objc func addMedecines() {
        if let addMedicinesViewController = storyboard?.instantiateViewController(withIdentifier: "AddMedicinesViewController") as? AddMedicinesViewController {
            present(addMedicinesViewController, animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicinesCell", for: indexPath)
            cell.textLabel?.text = medicines[indexPath.row]
        return cell
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(
            title: NSLocalizedString("Instruction for \(medicines[indexPath.row]):\n\(meddescription[indexPath.row])",comment: "Instruction - title"),
            message: nil,
            preferredStyle: .alert
        )
        let closeAction = UIAlertAction(
            title: NSLocalizedString("Close", comment: "Instruction - close"),
            style: .cancel,
            handler: nil
        )
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    @IBAction func unwindFromAddMedicines(unwideSegue: UIStoryboardSegue) {
        guard let addMedicinesViewController = unwideSegue.source as? AddMedicinesViewController, let medicine = addMedicinesViewController.selectedMedicines, let instruction = addMedicinesViewController.instruction else { return }
        medicines.append(medicine)
        meddescription.append(instruction)
        tableView.reloadData()
    }
    
}

