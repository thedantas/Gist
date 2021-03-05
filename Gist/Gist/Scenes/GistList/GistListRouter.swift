//
//  GistListRouter.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

@objc protocol GistListRoutingLogic {
    func routeToForgotMyPasswordInputSms(segue: UIStoryboardSegue?)
    func routeToDetails(view: UIViewController?)
}

protocol GistListDataPassing {
    var dataStore: GistListDataStore? { get }
}

class GistListRouter: NSObject, GistListRoutingLogic, GistListDataPassing {

    // Var's
    weak var viewController: GistListViewController?
    var dataStore: GistListDataStore?
    
    // Routing
    func routeToForgotMyPasswordInputSms(segue: UIStoryboardSegue?) {
        if let segue = segue, let destinationVC = segue.destination as? GistDetailViewController {
            var destinationDS = destinationVC.router!.dataStore!
            passDataToForgotMyPasswordInputSms(source: dataStore!, destination: &destinationDS)
        }
    }
    
    func routeToDetails(view: UIViewController?){
        let gistDetailViewController = GistDetailViewController()
        var destinationDS = gistDetailViewController.router!.dataStore!
        passDataToForgotMyPasswordInputSms(source: dataStore!, destination: &destinationDS)
        view?.navigationController?.pushViewController(gistDetailViewController, animated: true)
        
    }
    // Passing data
    func passDataToForgotMyPasswordInputSms(source: GistListDataStore, destination: inout GistDetailDataStore) {
        destination.selectGist = source.selectGist
    
    }
    
}
