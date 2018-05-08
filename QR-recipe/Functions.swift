//
//  Functions.swift
//  QR-recipe
//
//  Created by Vitalii Havryliuk on 5/8/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

func showLogOutAlert(_ viewController: UIViewController) {
    let alert = UIAlertController(title: NSLocalizedString("Are you sure?", comment: "LogOut - title"), message: nil, preferredStyle: .alert)
    let logOutAction = UIAlertAction(
        title: NSLocalizedString("Log Out", comment: "LogOut - exit"),
        style: .destructive,
        handler: { _ in
            viewController.dismiss(animated: true, completion: nil)
            //FIXME: write a logic
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
