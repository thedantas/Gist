//
//  GistListViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit

class GistListViewController: UIViewController {
    
    //MARK: Protocol
    var interactor: GistListBusinessLogic?
    var router: (NSObjectProtocol & GistListRoutingLogic & GistListDataPassing)?
    var page:Int = 0
    let cellId = "cellId"
    var gistValue: [GistsViewData] = []
    var filteredData: [GistsViewData] = []
    var selectData = GistsViewData()
    let searchBar = UISearchBar()
    let tableView = UITableView()
    var searchActive: Bool = false

    
    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func loadView() {
        view = tableView
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
       
        tableView.register(GistCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        self.interactor?.getGistList(request: GistList.GetGistList.Request(page: page))

    }
    
    func fetchGist(gists: [GistsViewData]) {
        gistValue.removeAll()
        gistValue.append(contentsOf: gists)
        filteredData.removeAll()
        filteredData.append(contentsOf: gists)
        tableView.reloadData()
    }

    @objc func handleShowSearchBar() {
        searchBar.becomeFirstResponder()
        search(shouldShow: true)
    }

    // MARK: - Helper Functions
    
    func configureUI() {
        view.backgroundColor = .white
       
        searchBar.sizeToFit()
        searchBar.delegate = self
     
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255,
                                                 blue: 250/255, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        let leftNaviButton = UIBarButtonItem(title: "Favorite", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Tapped1))
         self.navigationItem.leftBarButtonItem = leftNaviButton
        self.title = "Gist"
        showSearchBarButton(shouldShow: true)
    }
    
    @objc func Tapped1() {
        self.navigationController?.pushViewController(FavoriteListViewController(), animated: true)
    }

    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }

}
