//
//  FavoriteListViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit

// MARK: - Coordinator
protocol FavoriteListViewControllerCoordinator: AnyObject {
    
}
class FavoriteListViewController: UIViewController {

    //MARK: Protocol
    private weak var coordinator: FavoriteListViewControllerCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Favorites"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
