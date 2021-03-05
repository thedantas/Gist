//
//  FavoriteListCoordinator.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

final class FavoriteListCoordinator: NSObject, Coordinator {
    var children = [Coordinator]()
    let navigationController = UINavigationController()

    

    override init() {
        super.init()
    }

    func start() {
        let deviceScanViewController = FavoriteListViewController()
        navigationController.viewControllers = [deviceScanViewController]
        navigationController.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            navigationController.tabBarItem = UITabBarItem(
                title: "Favorites",
                image: UIImage(systemName: "star"),
                selectedImage: UIImage(systemName: "stat.fill"))
        } else {
            navigationController.tabBarItem.title = "Favorites"
        }
    }
}
