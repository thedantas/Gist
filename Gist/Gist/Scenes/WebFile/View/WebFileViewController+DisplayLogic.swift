//
//  WebFileViewController+DisplayLogic.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

protocol WebFileDisplayLogic: class {
    func displayWebFile(viewModel: WebFile.GetWebFile.ViewModel.Success)
    func displayWebFile(viewModel: WebFile.GetWebFile.ViewModel.Failure)


}


extension WebFileViewController: WebFileDisplayLogic {

    func displayWebFile(viewModel: WebFile.GetWebFile.ViewModel.Success){
        webView.load(URLRequest(url: URL(string: viewModel.gist)!))
    }
    func displayWebFile(viewModel: WebFile.GetWebFile.ViewModel.Failure){
        
    }

}
