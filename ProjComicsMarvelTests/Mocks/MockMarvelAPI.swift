//
//  MockMarvelAPI.swift
//  ProjComicsMarvelTests
//
//  Created by Bruno Andrade on 2023-04-06.
//

import Foundation
@testable import ProjComicsMarvel

class MockMarvelAPISuccess: MarvelAPIProtocol {
    func loadHeros(name: String?, page: Int, onComplete: @escaping (ProjComicsMarvel.MarvelInfo?) -> Void) {
        
        
        let marvelData = MarvelData(offset: 0, limit: 0, total: 2, count: 1, results: [
            Hero(id: 1, name: "Spider Man", description: "teia", thumbnail: Thumbnail(path: "", ext: ""), urls: []),
            Hero(id: 1, name: "Iron Men", description: "iron", thumbnail: Thumbnail(path: "", ext: ""), urls: [])
        ])
        
        let info = MarvelInfo(code: 1, status: "status", data: marvelData)
        
        onComplete(info)
    }
    
    
}
