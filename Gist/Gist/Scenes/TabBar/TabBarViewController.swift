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
        configureUI()
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

    func configureUI() {
        view.backgroundColor = .white
  
     
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255,
                                                 blue: 250/255, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        self.title = "Gist"
       // showSearchBarButton(shouldShow: true)
    }

}
