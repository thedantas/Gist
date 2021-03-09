//
//  FavoriteListViewController+DisplayLogic.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

protocol FavoriteListDisplayLogic: class {
    func displayFavoriteList(viewModel: FavoriteList.GetGistList.ViewModel.Success)
    func displayFailureFavoriteList(viewModel: FavoriteList.GetGistList.ViewModel.Failure)
    func displaySelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Success)
    func displayFailureSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Failure)
    func displayUnSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Success)
    func displayFailureUnSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Failure)
}

extension FavoriteListViewController: FavoriteListDisplayLogic {
    func displayUnSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Success) {
        filteredData.removeAll()
        gistValue.removeAll()
        interactor?.getFavoriteList(request: FavoriteList.GetGistList.Request())
    }
    
    func displayFailureUnSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Failure) {
        showAlert(message: "there was a problem, try again: \(viewModel.error)")
    }
    
    func displaySelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Success) {
        if let url = URL(string: viewModel.selectGist.htmlUrl) {
            UIApplication.shared.open(url)
        }
    }
    
    func displayFailureSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Failure) {
        showAlert(message: "there was a problem, try again: \(viewModel.error)")
    }
    
    
    func displayFavoriteList(viewModel: FavoriteList.GetGistList.ViewModel.Success) {
        gistValue.append(contentsOf: viewModel.gists)
        fetchGist(gists: gistValue)
        
    }
    func displayFailureFavoriteList(viewModel: FavoriteList.GetGistList.ViewModel.Failure) {
        showAlert(message: "there was a problem, try again: \(viewModel.error)")
    }
    
}
