//
//  MarvelClasses.swift
//  ProjComicsMarvel
//
//  Created by test on 04/03/23.
//

import Foundation

struct MarvelInfo: Codable {	
    let code: Int
    let status: String
    let data: MarvelData
    
    /* "code": 200,
     "status": "Ok",
     "copyright": "© 2023 MARVEL",
     "attributionText": "Data provided by Marvel. © 2023 MARVEL",
     "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2023 MARVEL</a>",
     "etag": "89f761c83ed3afaf88866804b5d3be43b26a5c88",
     "data":*/
}

struct MarvelData: Codable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
    
    /* "offset": 0,
     "limit": 20,
     "total": 1562,
     "count": 20,
     "results": */
}

struct Hero: Codable{
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let urls: [HeroURL]
    
    /*" id": 1011334,
     "name": "3-D Man",
     "description": "",
     "modified": "2014-04-29T14:18:17-0400",
     "thumbnail": */
}

struct Thumbnail: Codable {
    let path: String //caminho
    let ext: String // extenção
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

struct HeroURL: Codable {
    let type: String
    let url: String
}
