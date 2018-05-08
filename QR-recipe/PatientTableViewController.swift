//
//  PatientViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/7/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class PatientTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var isDoctor = false
    var patient: String?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var medicalIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patient"
        if let patient = patient {
            nameLabel.text = patient
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if isDoctor {
            return 2
        } else {
            return 1
        }
    }

}
