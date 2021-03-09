//
//  GistListViewController+SearchBar.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

extension GistListViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        search(shouldShow: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 
        searchActive = true
        if (searchText == ""){
              filteredData = gistValue
          }
          else{
              filteredData = []
        
              filteredData = gistValue.filter{
                $0.owner.login.lowercased().contains(searchText.lowercased())
              }
          }
          self.tableView.reloadData()
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        self.searchBar.endEditing(true)
    }
}
