//
//  GistDetailViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit

// MARK: - Coordinator
//protocol GistDetailViewControllerCoordinator: AnyObject {
//    
//}

class GistDetailViewController: UIViewController {

    //private weak var coordinator: GistDetailViewControllerCoordinator?
    var device: GistsListViewData?
    var interactor: GistDetailBusinessLogic?
    var router: (NSObjectProtocol & GistDetailRoutingLogic & GistDetailDataPassing)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(device)
        interactor?.getGistDetail(request: GistDetail.GetGistDetail.Request())
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
//    init(coordinator: GistDetailViewControllerCoordinator, device: GistsListViewData) {
//        self.coordinator = coordinator
//        self.device = device
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
