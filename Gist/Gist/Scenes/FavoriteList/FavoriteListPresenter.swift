//
//  FavoriteListPresenter.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

protocol FavoriteListPresentationLogic {
    func presentGistList(response: FavoriteList.GetGistList.Response.Success)
    func presentGistList(response: FavoriteList.GetGistList.Response.Failure)
    func presentSelectGist(response: FavoriteList.SelectGist.Response.Success)
    func presentSelectGist(response: FavoriteList.SelectGist.Response.Failure)

}

class FavoriteListPresenter: FavoriteListPresentationLogic {

    // Var's
    weak var viewController: FavoriteListDisplayLogic?

    func presentGistList(response: FavoriteList.GetGistList.Response.Success) {
        viewController?.displayFavoriteList(viewModel: FavoriteList.GetGistList.ViewModel.Success(gists: response.gists))
    }
    func presentGistList(response: FavoriteList.GetGistList.Response.Failure) {
        viewController?.displayFailureFavoriteList(viewModel: FavoriteList.GetGistList.ViewModel.Failure(error: response.error))
    }
    func presentSelectGist(response: FavoriteList.SelectGist.Response.Success) {
        viewController?.displaySelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Success(selectGist: response.selectGist))
    }
    
    func presentSelectGist(response: FavoriteList.SelectGist.Response.Failure) {
        viewController?.displayFailureSelectFavoriteList(viewModel: FavoriteList.SelectGist.ViewModel.Failure(error: response.error))
    }

}
