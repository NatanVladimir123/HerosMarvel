//
//  HeroController.swift
//  ProjComicsMarvel
//
//  Created by test on 24/03/23.
//

import Foundation
import UIKit
import FirebaseFirestore


class HeroController{
    
var alert: Alert?
    
    func addHero(name: String, nameHeroiSalvo: String, urlImageHero: String, idHero: String){
        
        if name == nameHeroiSalvo{
            self.alert?.getAlert(titulo: "Heroi já esta salvo", mensagem: "")
            
        }
    }
}
