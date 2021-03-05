//
//  GistDetailPresenter.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

protocol GistDetailPresentationLogic {
    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Success)
    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Failure)

}

class GistDetailPresenter: GistDetailPresentationLogic {

    // Var's
    weak var viewController: GistDetailDisplayLogic?

    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Success) {
       //print(response.caracter)
        
        viewController?.displayGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Success(caracter: response.caracter))
    }
    func presentGistDetail(response: GistDetail.GetGistDetail.Response.Failure) {
        viewController?.displayFailureGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Failure(error: response.error))
    }

}

