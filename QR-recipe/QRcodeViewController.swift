//
//  QRcodeViewController.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/10/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class QRcodeViewController: UIViewController {
    
    // MARK: - Properties
    
    var image: UIImage?
    
    // MARK: - Outlets
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var QRcodeImageView: UIImageView!

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.delegate = self
        if let image = image {
            QRcodeImageView.image = image
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Extensions

extension QRcodeViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
