//
//  GistDetailRouter.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

@objc protocol GistDetailRoutingLogic {
    func routeToWebFile(view: UIViewController?)
}

protocol GistDetailDataPassing {
    var dataStore: GistDetailDataStore? { get }
}

class GistDetailRouter: NSObject, GistDetailRoutingLogic, GistDetailDataPassing {

    // Var's
    weak var viewController: GistDetailViewController?
    var dataStore: GistDetailDataStore?
    
    // Routing
    func routeToWebFile(view: UIViewController?){
        let gistDetailViewController = WebFileViewController()
        var destinationDS = gistDetailViewController.router!.dataStore!
        passDataToDatail(source: dataStore!, destination: &destinationDS)
        view?.navigationController?.pushViewController(gistDetailViewController, animated: true)
        
    }
    // Passing data
    func passDataToDatail(source: GistDetailDataStore, destination: inout WebFileDataStore) {
        destination.urlFile = source.urlFile
    
    }
    
}

