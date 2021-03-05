//
//  GistDetailRouter.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

@objc protocol GistDetailRoutingLogic {

}

protocol GistDetailDataPassing {
    var dataStore: GistDetailDataStore? { get }
}

class GistDetailRouter: NSObject, GistDetailRoutingLogic, GistDetailDataPassing {

    // Var's
    weak var viewController: GistDetailViewController?
    var dataStore: GistDetailDataStore?

}

