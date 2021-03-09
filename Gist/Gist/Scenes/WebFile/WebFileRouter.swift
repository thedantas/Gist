//
//  WebFileRouter.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

@objc protocol WebFileRoutingLogic {
 
}

protocol WebFileDataPassing {
    var dataStore: WebFileDataStore? { get }
}

class WebFileRouter: NSObject, WebFileRoutingLogic, WebFileDataPassing {

    // Var's
    weak var viewController: WebFileViewController?
    var dataStore: WebFileDataStore?
    

}

