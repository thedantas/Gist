//
//  GistDetailViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit

class GistDetailViewController: UIViewController {

    var gist: GistsViewData?
    var interactor: GistDetailBusinessLogic?
    var router: (NSObjectProtocol & GistDetailRoutingLogic & GistDetailDataPassing)?
    
    //MARK: Layout
    public let ownerLabel: UILabel = {
        let label = UILabel()
        label.text = "Owner:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    public let ownerImage: UIImageView = {
        let ownerImage =  UIImageView()
        ownerImage.frame = CGRect(x: 0,y: 0,width: 200, height: 200)
        ownerImage.layer.borderColor = UIColor.white.cgColor
        ownerImage.layer.borderWidth = 3.0
        ownerImage.layer.cornerRadius = ownerImage.frame.size.height/2
        ownerImage.layer.masksToBounds = false
        ownerImage.clipsToBounds = true
        ownerImage.contentMode = .scaleAspectFill
        ownerImage.translatesAutoresizingMaskIntoConstraints = false
        
 
        return ownerImage
    }()
    
    private var tableView: InsetGroupedTableView = {
        let tableView = InsetGroupedTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var tableViewManager = TableViewManager(with: tableView)
    var locally: [File] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.getGistDetail(request: GistDetail.GetGistDetail.Request())
        
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
    
    private func setupViews() {
        view.addSubview(ownerLabel)
        view.addSubview(ownerImage)
        view.addSubview(tableView)
        view.backgroundColor = .lightGray
        tableView.register(FileInformationCell.self)
        
        
        NSLayoutConstraint.activate([
            ownerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            ownerImage.widthAnchor.constraint(equalToConstant: 200),
            ownerImage.heightAnchor.constraint(equalToConstant: 200),
            ownerImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            ownerLabel.topAnchor.constraint(equalTo: ownerImage.bottomAnchor, constant: 20),
            ownerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ownerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: ownerImage.bottomAnchor, constant: 60),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])

        
    }
    private func makeDeviceRowConfigurator(from file: File) -> FileInformationCellRowConfigurator {
        let onTap: (() -> Void) = { [weak self] in
            guard let self = self else { return }
            self.interactor?.selectFile(request: GistDetail.SelectFile.Request(selectFile: file))
        }
        let model = FileInformationCell.Model(type: file.type, filename: file.filename, onTap: onTap)
        return FileInformationCellRowConfigurator(model: model)
    }
    private func header(with title: String) -> TitleHeaderFooterConfigurator {
        let model = TitleHeaderFooter.Model(title: title)
        return TitleHeaderFooterConfigurator(model: model)
    }
    
    func fetchFiles(stDevices: [File]) {
        tableViewManager.data = [TableSection(rows: stDevices.map(makeDeviceRowConfigurator(from:)))]
        tableView.reloadData()
    }
}
