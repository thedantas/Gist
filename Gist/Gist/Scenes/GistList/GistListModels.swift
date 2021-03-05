//
//  GistListModels.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import Foundation
import UIKit

enum GistList {
    enum GetGistList {
        struct Request {
            var page: Int
        }
        enum Response {
            struct Failure {
                var error: Error
            }
            struct Success {
                var gists: [GistsListViewData]
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var gists: [GistsListViewData]
            }
        }
    }
    enum SelectGist {
        struct Request {
            var selectGist: GistsListViewData
        }
        enum Response {
            struct Failure {
                var error: Error
            }
            struct Success {
                var selectGist: GistsListViewData
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var selectGist: GistsListViewData
            }
        }
    }
}

class GistsListViewData {
    var gistsUrl: String = String()
    var id: String = String()
    var htmlUrl: String = String()
    var files: FileViewData = FileViewData()
    var gistsPublic: Bool = false
    var createdAt: String = String()
    var lastUpdate: String = String()
    var gistsDescription: String = String()
    var comments: Int = 0
    var commnentsUrl: String = String()
    var owner: OwnerViewData = OwnerViewData()
    var favorite: Bool = false
}

class OwnerViewData {
    var login: String = String()
    var id: Int = 0
    var avatar: String = String()
    var profileURL: String = String()
    var gistsURL: String = String()
    var repo: String = String()
}

class FileExtract {
    var key: String
    var files: File
    init(key: String, file: File) {
        self.key = key
        self.files = file
    }
}

class FileViewData {
    var filename: String = String()
    var language: String = String()
    var type: String = String()
    var size: Int = 0
}

