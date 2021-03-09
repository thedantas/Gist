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
    func displayFavoriteGist(viewModel: GistList.FavoriteGist.ViewModel.Success)
    func displayFailureFavoriteGist(viewModel: GistList.FavoriteGist.ViewModel.Failure)
}


extension GistListViewController: GistListDisplayLogic {
    
    func displayFavoriteGist(viewModel: GistList.FavoriteGist.ViewModel.Success) {
        
    }
    
    func displayFailureFavoriteGist(viewModel: GistList.FavoriteGist.ViewModel.Failure) {
        showAlert(message: "there was a problem, try again: \(viewModel.error)")
    }
    
    func displayGistList(viewModel: GistList.GetGistList.ViewModel.Success) {
        gistValue.append(contentsOf: viewModel.gists)
        fetchGist(gists: gistValue)
        
    }
    func displayFailureGistList(viewModel: GistList.GetGistList.ViewModel.Failure) {
        showAlert(message: "there was a problem, try again: \(viewModel.error)")
    }
    func displaySelectGist(viewModel: GistList.SelectGist.ViewModel.Success) {
        self.router?.routeToDetails(view: self)
    }
    
    func displayFailureSelectGist(viewModel: GistList.SelectGist.ViewModel.Failure) {
        showAlert(message: "there was a problem, try again: \(viewModel.error)")
    }
}
