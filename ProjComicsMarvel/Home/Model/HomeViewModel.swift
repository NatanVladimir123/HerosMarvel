//
//  HomeViewModel.swift
//  ProjComicsMarvel
//
//  Created by Bruno Andrade on 2023-04-06.
//

import Foundation

class HomeViewModel {
    var heros: [Hero] = []
    var marvelAPI: MarvelAPIProtocol
    
    init(marvelAPI: MarvelAPIProtocol = MarvelApi()) {
        self.marvelAPI = marvelAPI
    }
    
    func loadHeros(name: String = "", currentPage: Int = 0, isSearch: Bool = false, completion: @escaping (Result<Int, NetworkError>) -> Void) {
        self.marvelAPI.loadHeros(name: name, page: currentPage) { info in
            if let info = info {
                if isSearch {
                    self.heros = info.data.results//adcionando contagem dos herios
                } else {
                    self.heros += info.data.results
                }
                
                completion(.success(info.data.total))
            } else {
                completion(.failure(.error))
            }
        }
    }
}


enum NetworkError: Error {
    case error
}
