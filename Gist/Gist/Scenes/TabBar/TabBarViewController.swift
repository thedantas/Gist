//
//  TabBarViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 05/03/21.
//

import UIKit

class TabBarViewController: UITabBarController {
   // let navigationController = UINavigationController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [initialTabBar, finalTabBar]
        // Do any additional setup after loading the view.
    }
    lazy public var initialTabBar: GistListViewController = {
        let navigationController = UINavigationController()
        let gistListViewController = GistListViewController()
        navigationController.viewControllers = [gistListViewController]
        navigationController.navigationBar.prefersLargeTitles = true

        gistListViewController.tabBarItem = UITabBarItem(
            title: "Gist",
            image: UIImage(systemName: "list.bullet"),
            selectedImage: UIImage(systemName: "list.bullet"))
 
    

        return gistListViewController
    }()
    
    lazy public var finalTabBar: FavoriteListViewController = {
        let navigationController = UINavigationController()
        
        let deviceScanViewController = FavoriteListViewController()
        navigationController.viewControllers = [deviceScanViewController]
        navigationController.navigationBar.prefersLargeTitles = true
        deviceScanViewController.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "stat.fill"))

  
        
        return deviceScanViewController
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
