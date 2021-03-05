//
//  GistListCoordinator.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

final class GistListCoordinator: NSObject, Coordinator {
    var children = [Coordinator]()
    let navigationController = UINavigationController()

    override init() {
        super.init()
    }

    func start() {
        let gistListViewController = GistListViewController(coordinator: self)
        navigationController.viewControllers = [gistListViewController]
        navigationController.navigationBar.prefersLargeTitles = true

        if #available(iOS 13.0, *) {
            navigationController.tabBarItem = UITabBarItem(
                title: "Gist",
                image: UIImage(systemName: "list.bullet"),
                selectedImage: UIImage(systemName: "list.bullet"))
        } else {
            navigationController.tabBarItem.title = "Gist"
        }
    }
}

// MARK: DeviceScanViewControllerCoordinator
extension GistListCoordinator: GistListViewControllerCoordinator {

    func showDeviceDetails(from: GistListViewController, selectedDevice: GistsListViewData) {
//        let gistDetailViewController = GistDetailViewController(coordinator: self, device: selectedDevice)
//       navigationController.pushViewController(gistDetailViewController, animated: true)
//       
    }
}

// MARK: GistDetailViewControllerCoordinator
//extension GistListCoordinator: GistDetailViewControllerCoordinator {
//    
//}
