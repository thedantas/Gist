//
//  WebViewController.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import UIKit
import WebKit

class WebFileViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    lazy var webView: WKWebView = {
        let wv = WKWebView()
        wv.uiDelegate = self
        wv.navigationDelegate = self
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()

    var urlReceive: String?
    
    // Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    var interactor: WebFileBusinessLogic?
    var router: (NSObjectProtocol & WebFileRoutingLogic & WebFileDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(webView)
            NSLayoutConstraint.activate([
                webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                webView.topAnchor.constraint(equalTo: view.topAnchor),
                webView.rightAnchor.constraint(equalTo: view.rightAnchor),
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        interactor?.getWebFile(request: WebFile.GetWebFile.Request())
    }
    
}
