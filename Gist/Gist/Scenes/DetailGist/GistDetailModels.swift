//
//  GistDetailModels.swift
//  Gist
//
//  Created by André  Costa Dantas on 04/03/21.
//

import Foundation
import UIKit

enum GistDetail {
    enum GetGistDetail {
        struct Request {
        //    var page: Int
        }
        enum Response {
            struct Failure {
                var error: Error
            }
            struct Success {
                var gist: GistsViewData
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var gist: GistsViewData
            }
        }
    }
    enum SelectFile {
        struct Request {
                var selectFile: File
        }
        enum Response {
            struct Failure {
                var error: Error
            }
            struct Success {
                var selectGist: String
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var selectGist: String
            }
        }
    }
}
