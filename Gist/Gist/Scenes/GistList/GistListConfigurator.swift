//
//  GistListConfigurator.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit
import Moya

extension GistListViewController {

    // Setup
    func setup() {

        let viewController          = self
        let provider = MoyaProvider<GistsRouter>()
        let service = GistListWorker(provider: provider)
        let interactor              = GistListInteractor(service: service)
        let presenter               = GistListPresenter()
        let router                  = GistListRouter()

        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
        
    }    

}
