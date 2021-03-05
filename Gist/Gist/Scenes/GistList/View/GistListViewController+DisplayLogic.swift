//
//  GistListViewController+DisplayLogic.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

protocol GistListDisplayLogic: class {
    func displayGistList(viewModel: GistList.GetGistList.ViewModel.Success)
    func displayFailureGistList(viewModel: GistList.GetGistList.ViewModel.Failure)
    func displaySelectGist(viewModel: GistList.SelectGist.ViewModel.Success)
    func displayFailureSelectGist(viewModel: GistList.SelectGist.ViewModel.Failure)

}


extension GistListViewController: GistListDisplayLogic {

    func displayGistList(viewModel: GistList.GetGistList.ViewModel.Success) {
        print(viewModel.gists.count)
        locally.append(contentsOf: viewModel.gists)
        fetchDevices(stDevices: locally)
     //   self.caracter.append(contentsOf: viewModel.caracter) ///= viewModel.caracter
      //  print(self.caracter)
        //print(viewModel.caract)
        //tableView.reloadData()
        
    }
    func displayFailureGistList(viewModel: GistList.GetGistList.ViewModel.Failure) {
     
    }
    func displaySelectGist(viewModel: GistList.SelectGist.ViewModel.Success) {
        self.router?.routeToDetails(view: self)
    }
    
    func displayFailureSelectGist(viewModel: GistList.SelectGist.ViewModel.Failure) {
        
    }
}
