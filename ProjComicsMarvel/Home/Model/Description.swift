//
//  HomeModel.swift
//  ProjComicsMarvel
//
//  Created by test on 01/03/23.
//

import Foundation
import UIKit


class SaveHerosApi: Codable{
    let name: String
    let descripion: String
    let urlImage: String
    
    init(name: String, descripion: String, urlImage: String) {
        self.name = name
        self.descripion = descripion
        self.urlImage = urlImage
    }
    
}



