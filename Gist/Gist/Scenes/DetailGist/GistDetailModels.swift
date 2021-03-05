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
                var caracter: GistsListViewData
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var caracter: GistsListViewData
            }
        }
    }
}
