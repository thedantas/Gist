//
//  GistDetailViewController+DisplayLogic.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

protocol GistDetailDisplayLogic: class {
    func displayGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Success)
    func displayFailureGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Failure)
    
    func displaySelectFile(viewModel: GistDetail.SelectFile.ViewModel.Success)
    func displayFailureSelectFile(viewModel: GistDetail.SelectFile.ViewModel.Failure)

}


extension GistDetailViewController: GistDetailDisplayLogic {
    
    func displaySelectFile(viewModel: GistDetail.SelectFile.ViewModel.Success) {
        self.router?.routeToWebFile(view: self)
    }
    
    func displayFailureSelectFile(viewModel: GistDetail.SelectFile.ViewModel.Failure) {
        
    }
    
   
    func displayGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Success) {
        ownerLabel.text = "Owner : \(viewModel.gist.owner.login)"
        ownerImage.kf.setImage(with: URL(string: viewModel.gist.owner.avatar))
        fetchFiles(stDevices: viewModel.gist.files)
    }
    func displayFailureGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Failure)
    {
     
    }

}
