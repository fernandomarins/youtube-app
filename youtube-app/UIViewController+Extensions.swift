//
//  UIViewController+Extensions.swift
//  youtube-app
//
//  Created by Fernando Marins on 07/12/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
