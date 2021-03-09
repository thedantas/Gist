//
//  GistListViewController+TableView.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

extension GistListViewController: UITableViewDelegate, UITableViewDataSource, CollectionProtocol {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GistCell
        let currentLastItem = filteredData[indexPath.row]
        
        var file = ""
        for element in currentLastItem.files {
            file += " \(element.type)"
        }
        cell.delegate = self
        cell.gistSelect = currentLastItem
        cell.update(description: currentLastItem.gistsDescription, login: currentLastItem.owner.login, state: file, image: currentLastItem.owner.avatar, git: currentLastItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = filteredData[indexPath.row]
        self.interactor?.selectGist(request: GistList.SelectGist.Request(selectGist: selectItem))
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == filteredData.count - 1 {
            if !self.searchActive {
                self.page += 1
                self.interactor?.getGistList(request: GistList.GetGistList.Request(page: page))
            }
         
        }
    }
    
    func onFavoriteGist(index: GistsViewData) {
        interactor?.favoriteGist(request: GistList.SelectGist.Request(selectGist: index))
    }
    
 
    
}
