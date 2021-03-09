//
//  FavoriteListConfigurator.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit
import Moya

extension FavoriteListViewController {

    // Setup
    func setup() {

        let viewController          = self
        let interactor              = FavoriteListInteractor()
        let presenter               = FavoriteListPresenter()
        let router                  = FavoriteListRouter()

        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
        
    }

}
