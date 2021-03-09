//
//  GistListPresenter.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

protocol GistListPresentationLogic {
    func presentGistList(response: GistList.GetGistList.Response.Success)
    func presentGistList(response: GistList.GetGistList.Response.Failure)
    func presentSelectGist(response: GistList.SelectGist.Response.Success)
    func presentSelectGist(response: GistList.SelectGist.Response.Failure)
    func presentFavoriteGist(response: GistList.FavoriteGist.Response.Success)
    func presentFavoriteGist(response: GistList.FavoriteGist.Response.Failure)

}

class GistListPresenter: GistListPresentationLogic {

    // Var's
    weak var viewController: GistListDisplayLogic?

    func presentGistList(response: GistList.GetGistList.Response.Success) {
        viewController?.displayGistList(viewModel: GistList.GetGistList.ViewModel.Success(gists: response.gists))
    }
    func presentGistList(response: GistList.GetGistList.Response.Failure) {
        viewController?.displayFailureGistList(viewModel: GistList.GetGistList.ViewModel.Failure(error: response.error))
    }
    func presentSelectGist(response: GistList.SelectGist.Response.Success) {
        viewController?.displaySelectGist(viewModel: GistList.SelectGist.ViewModel.Success(selectGist: response.selectGist))
    }
    
    func presentSelectGist(response: GistList.SelectGist.Response.Failure) {
        viewController?.displayFailureSelectGist(viewModel: GistList.SelectGist.ViewModel.Failure(error: response.error))
    }
    func presentFavoriteGist(response: GistList.FavoriteGist.Response.Success) {
        viewController?.displayFavoriteGist(viewModel: GistList.FavoriteGist.ViewModel.Success(selectGist: response.selectGist))
    }
    
    func presentFavoriteGist(response: GistList.FavoriteGist.Response.Failure) {
        viewController?.displayFailureFavoriteGist(viewModel: GistList.FavoriteGist.ViewModel.Failure(error: response.error))
    }
}
