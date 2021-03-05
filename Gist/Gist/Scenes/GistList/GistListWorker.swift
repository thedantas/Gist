//
//  GistListWorker.swift
//  Gist
//
//  Created by André  Costa Dantas on 02/03/21.
//

import UIKit
import Moya

protocol GistListWorkerProtocol {
    var provider: MoyaProvider<GistsRouter> { get set }
    func fetchList(page: Int, completion: @escaping(Result<[GistsResponse]>) -> Void)
}

class GistListWorker: GistListWorkerProtocol {
    
    var provider: MoyaProvider<GistsRouter>
    
    init(provider: MoyaProvider<GistsRouter>) {
        self.provider = provider
    }
    
    func fetchList(page: Int, completion: @escaping (Result<[GistsResponse]>) -> Void) {
        provider.request(.gistsPublic(page)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map([GistsResponse].self, atKeyPath: nil, using: JSONDecoder())
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
     }
}


