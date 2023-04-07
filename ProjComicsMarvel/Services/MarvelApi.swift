//
//  MarvelApi.swift
//  ProjComicsMarvel
//
//  Created by test on 04/03/23.
//

import Foundation
import SwiftHash
import Alamofire

protocol MarvelAPIProtocol {
    func loadHeros(name: String?, page: Int, onComplete: @escaping (MarvelInfo?) -> Void)
}

class MarvelApi: MarvelAPIProtocol {
    
    private let basePath = "https://gateway.marvel.com:443/v1/public/characters"
    private let privateKey = "639d7b3c9335d7858cc4fca2cff064042dbc07d6"
    private let publicKey = "4d44ce5f7fca31ecc83aa404b3adfeb7"
    private let limit = 50
    
    //limitando a quantidade de buscas na api
    func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        var	startsWith: String
        if let name = name, !name.isEmpty{
            startsWith = name.replacingOccurrences(of: " ", with: "")
        }else{
            startsWith = ""
        }
        
        let url = basePath //+ "&offset=\(offset)&limit=\(limit)&" + startsWith + getCredenciais()
        print(url)
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        var params = [
            "apikey" : publicKey,
            "ts" : ts,
            "hash" : hash,
            "offset" : offset,
            "limit" : limit
        ] as [String : Any]
        
        if !startsWith.isEmpty{
            params["nameStartsWith"] = startsWith
        }
       
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            do{
        
                if let data = response.data{
                    let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                    print(marvelInfo.code)
                    //let foods = try decoder.decode(JSONFoods.self, from: data) //Decode JSON Response Data
                    if marvelInfo.code == 200{
                        onComplete(marvelInfo)
                    }else{
                        onComplete(nil)
                    }
                }
            } catch let error{
                print("\n---------\n",error,"\n----------\n")
                onComplete(nil)
                return
            }
        }
        
    }
    
   /* private class func getCredenciais() -> String{
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        //ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150
    }*/
}
