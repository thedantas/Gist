//
//  GistDetailConfigurator.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit
import Moya

extension GistDetailViewController {

    // Setup
    func setup() {

        let viewController          = self
        let interactor              = GistDetailInteractor()
        let presenter               = GistDetailPresenter()
        let router                  = GistDetailRouter()

        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
        
    }

    // Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

}
