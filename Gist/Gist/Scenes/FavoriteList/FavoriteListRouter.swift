//
//  FavoriteListRouter.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

@objc protocol FavoriteListRoutingLogic {
    
}

protocol FavoriteListDataPassing {
    var dataStore: FavoriteListDataStore? { get }
}

class FavoriteListRouter: NSObject, FavoriteListRoutingLogic, FavoriteListDataPassing {

    // Var's
    weak var viewController: FavoriteListViewController?
    var dataStore: FavoriteListDataStore?
    
    
}
