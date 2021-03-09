//
//  WebFileModels.swift
//  Gist
//
//  Created by André  Costa Dantas on 08/03/21.
//

import Foundation
import UIKit

enum WebFile {
    enum GetWebFile {
        struct Request {
        //    var page: Int
        }
        enum Response {
            struct Failure {
                var error: Error
            }
            struct Success {
                var gist: String
            }
        }
        enum ViewModel {
            struct Failure {
                var error: Error
            }
            struct Success {
               var gist: String
            }
        }
    }
}
