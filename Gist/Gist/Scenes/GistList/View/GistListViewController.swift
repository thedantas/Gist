//
//  GistListViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit

// MARK: - Coordinator
protocol GistListViewControllerCoordinator: AnyObject {
    func showDeviceDetails(from: GistListViewController, selectedDevice: GistsViewData)
}

class GistListViewController: UIViewController {

    //MARK: Protocol
    private weak var coordinator: GistListViewControllerCoordinator?
    var interactor: GistListBusinessLogic?
    var router: (NSObjectProtocol & GistListRoutingLogic & GistListDataPassing)?
    var page:Int = 1
    
    var locally: [GistsViewData] = []
    private var tableView = InsetGroupedTableView()
    private lazy var tableViewManager = TableViewManager(with: tableView)

    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
//    init(coordinator: GistListViewControllerCoordinator) {
//        self.coordinator = coordinator
//        super.init(nibName: nil, bundle: nil)
//        setup()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.navigationItem.title = "Gist"
        self.title = "Gist"
        
        
        self.interactor?.getGistList(request: GistList.GetGistList.Request(page: page))
        tableView.register(DeviceCell.self)
    }
 
    private func makeDeviceRowConfigurator(from device: GistsViewData) -> DeviceRowConfigurator {
        let onTap: (() -> Void) = { [weak self] in
            guard let self = self else { return }
          //self.coordinator?.showDeviceDetails(from: self, selectedDevice: device)
            //self.performSegue(withIdentifier: "GistDetailViewController", sender: self)
            self.interactor?.selectGist(request: GistList.SelectGist.Request(selectGist: device))
          //  self.router?.routeToDetails(view: self)
        }
        let model = DeviceCell.Model(description: device.gistsDescription , login: device.owner.login, state: device.files.type, image: device.owner.avatar, onTap: onTap)
        return DeviceRowConfigurator(model: model)
    }
    private func header(with title: String) -> TitleHeaderFooterConfigurator {
        let model = TitleHeaderFooter.Model(title: title)
        return TitleHeaderFooterConfigurator(model: model)
    }
    
    func fetchDevices(stDevices: [GistsViewData]) {
        tableViewManager.data = [TableSection(rows: stDevices.map(makeDeviceRowConfigurator(from:)))]
        tableView.reloadData()
    }
    
}

