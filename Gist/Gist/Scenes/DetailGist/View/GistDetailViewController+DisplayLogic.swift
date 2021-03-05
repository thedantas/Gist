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

}


extension GistDetailViewController: GistDetailDisplayLogic {
    func displayGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Success) {
  
    }
    func displayFailureGistDetail(viewModel: GistDetail.GetGistDetail.ViewModel.Failure)
 {
     
    }

}
