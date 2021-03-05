//
//  UIViewController+Extensions.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit

typealias AlertWithProgress = (alert: UIAlertController, progress: UIProgressView)

extension UIViewController {
    
    func showAlert(title: String = "Alert", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    func showLoading(title: String) -> UIAlertController {
        let alert = getLoadingView(title: title)

        present(alert, animated: true, completion: nil)

        return alert
    }
    
    func getLoadingView(title: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            loadingIndicator.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 20),
            loadingIndicator.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 4)
        ])

        return alert
    }
    
    func dismissAllAlerts() {
        let viewController = self.presentedViewController
        guard let isKindOf = viewController?.isKind(of:
        UIAlertController.classForCoder()), isKindOf else {
            return
        }
        viewController?.dismiss(animated: false, completion: nil)
    }
    
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
