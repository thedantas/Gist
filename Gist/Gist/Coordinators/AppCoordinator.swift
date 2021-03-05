//
//  AppCoordinator.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

final class AppCoordinator: NSObject, Coordinator {
    var children = [Coordinator]()

    let tabBarController = UITabBarController()


    func start() {
        let gistListCoordinator = GistListCoordinator()
        gistListCoordinator.start()
        addChild(gistListCoordinator)

        let favoriteListCoordinator = FavoriteListCoordinator()
        favoriteListCoordinator.start()
        addChild(favoriteListCoordinator)
    
        
        tabBarController.viewControllers = [
            gistListCoordinator.navigationController,
            favoriteListCoordinator.navigationController
        ]
    }
}


