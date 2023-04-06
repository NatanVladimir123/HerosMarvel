//
//  HerosMenager.swift
//  ProjComicsMarvel
//
//  Created by test on 28/03/23.
//

import Foundation

class HerosMenager{
    
    static let shared = HerosMenager()
    let ud = UserDefaults.standard
    var herosS: [SaveHerosApi] = []
    
    private init() {
        if let data = ud.data(forKey: "herosSaveList"), let herosSave = try? JSONDecoder().decode([SaveHerosApi].self, from: data){
            self.herosS = herosSave
        }
    }
    
    func saveHerosM(){
        if let data = try? JSONEncoder().encode(herosS){
            ud.set(data, forKey: "herosSaveList")
        }
    }
    
    func addHero(_ hero: SaveHerosApi){
        herosS.append(hero)
        saveHerosM()
    }
    
    func removeHero(at index: Int){
        herosS.remove(at: index)
        saveHerosM()
    }
}
