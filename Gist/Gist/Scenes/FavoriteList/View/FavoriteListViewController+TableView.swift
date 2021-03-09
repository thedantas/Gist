//
//  FavoriteListViewController+TableView.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

extension FavoriteListViewController: UITableViewDelegate, UITableViewDataSource {
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
        cell.update(description: currentLastItem.gistsDescription, login: currentLastItem.owner.login, state: file, image: currentLastItem.owner.avatar)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = filteredData[indexPath.row]
        self.interactor?.selectFavoriteList(request: FavoriteList.SelectGist.Request(selectGist: selectItem))
    }
    
}

