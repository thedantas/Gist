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
                var gists: [GistsViewData]
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var gists: [GistsViewData]
            }
        }
    }
    enum SelectGist {
        struct Request {
            var selectGist: GistsViewData
        }
        enum Response {
            struct Failure {
                var error: Error
            }
            struct Success {
                var selectGist: GistsViewData
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var selectGist: GistsViewData
            }
        }
    }
}

