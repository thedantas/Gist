//
//  WebFileConfigurator.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation

extension WebFileViewController {

    // Setup
    func setup() {

        let viewController          = self
        let interactor              = WebFileInteractor()
        let presenter               = WebFilePresenter()
        let router                  = WebFileRouter()

        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
        
    }

}
