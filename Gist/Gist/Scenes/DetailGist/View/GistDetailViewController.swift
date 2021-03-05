//
//  GistDetailViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import UIKit

class GistDetailViewController: UIViewController {

    var device: GistsViewData?
    var interactor: GistDetailBusinessLogic?
    var router: (NSObjectProtocol & GistDetailRoutingLogic & GistDetailDataPassing)?
    
    //MARK: Layout
    public let nameTextField: UITextField = {
        let nameText = UITextField()
        nameText.placeholder = "Your Name"
        nameText.textAlignment = .left
        nameText.borderStyle = .roundedRect
        nameText.translatesAutoresizingMaskIntoConstraints = false
        nameText.keyboardType = .namePhonePad
        return nameText
    }()
    
    public let emailTextField: UITextField = {
        let emailText = UITextField()
        emailText.placeholder = "Email"
        emailText.textAlignment = .left
        emailText.borderStyle = .roundedRect
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailText.keyboardType = .emailAddress
        
        return emailText
    }()
    
    public let labelDescription: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public let descriptionTextView: UITextView = {
        let descriptionText = UITextView()
        descriptionText.textAlignment = .left
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.keyboardType = .default
        descriptionText.returnKeyType = .done
        descriptionText.layer.borderWidth = 1
        descriptionText.layer.cornerRadius = 10
        descriptionText.layer.borderColor = UIColor.gray.cgColor
        descriptionText.keyboardDismissMode = .interactive
    
        return descriptionText
    }()
    
    lazy var switchLog: UISwitch = {
        let switchLog = UISwitch()
        switchLog.isOn = true
        switchLog.translatesAutoresizingMaskIntoConstraints = false
        return switchLog
    }()
    
    lazy var labelTitlelog: UILabel = {
        let label = UILabel()
        label.font.withSize(12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    lazy var  stackLog: UIStackView = {
        let stackLog = UIStackView(arrangedSubviews: [switchLog, labelTitlelog])
        stackLog.spacing = 5
        stackLog.translatesAutoresizingMaskIntoConstraints = false
        stackLog.axis = .horizontal
        stackLog.distribution = .fillProportionally
        return stackLog
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
    
    private func setupViews() {
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(descriptionTextView)
        view.addSubview(labelDescription)
        view.addSubview(stackLog)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.bottomAnchor.constraint(equalTo: labelDescription.topAnchor, constant: -20),
            
            labelDescription.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            labelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionTextView.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            stackLog.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 5),
            stackLog.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackLog.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackLog.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            
        ])
    }
}
