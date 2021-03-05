//
//  UIViewControllerExtension+Segue.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

public protocol SegueHandler {
    associatedtype SegueIdentifiers: RawRepresentable
}

public extension SegueHandler where Self: UIViewController, SegueIdentifiers.RawValue == String {
    public func performSegue(segue: SegueIdentifiers) {
        self.performSegue(withIdentifier: segue.rawValue, sender: nil)
    }
}
