//
//  ShowMedicinesTableViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/10/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class ShowMedicinesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var medicines = ["med 1", "med 2", "med 3"]
    var meddescription = ["description 1", "description 2"]
    
    // MARK: - Outlets
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.delegate = self
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQRcode" {
            if let QRCodeViewController = segue.destination as? QRcodeViewController {
                let medicinesForQRCode = medicines.joined(separator: "\n")
                let data = medicinesForQRCode.data(using: .utf8, allowLossyConversion: false)
                if let filter = CIFilter(name: "CIQRCodeGenerator") {
                    filter.setValue(data, forKey: "inputMessage")
                    let transform = CGAffineTransform(scaleX: 10, y: 10)
                    if let output = filter.outputImage?.transformed(by: transform) {
                        QRCodeViewController.image = UIImage(ciImage: output)
                    }
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: - Extensions

extension ShowMedicinesTableViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
