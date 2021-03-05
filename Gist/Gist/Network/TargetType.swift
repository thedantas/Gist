//
//  TargetType.swift
//  Gist
//
//  Created by André  Costa Dantas on 03/03/21.
//

import Foundation
import Moya

enum Paths: String {
    case gistsPublic = "gists/public"
}

enum Keys: String {
    case page = "page"
}


extension TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.github.com/")!
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var headers: [String : String]? {
        return ["":""]
    }
}
