//
//  DescriptionViewController.swift
//  ProjComicsMarvel
//
//  Created by test on 10/03/23.
//

import UIKit

class DescriptionViewController: UIViewController {

    var descriptionView: DescriptionView?
    
    var alert: Alert?
    let hm = HerosMenager.shared
    var name: String?
    var desciçao: String?
    var imageHeros: String?
    var url: String?
    var heroObj: Hero!
    
    override func loadView() {
        self.descriptionView = DescriptionView()
        self.view = self.descriptionView
        
        self.descriptionView?.nameLabel.text = name
        self.descriptionView?.descriHeroLabel.text = desciçao
        if let url = URL(string: imageHeros ?? ""){
            self.descriptionView?.imageHero.kf.indicatorType = .activity //load da imagem
            self.descriptionView?.imageHero.kf.setImage(with: url)
        }else{
            self.descriptionView?.imageHero.image = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionView?.delegate(delegate: self)
    }

}

extension DescriptionViewController: DescriptionViewDelegate{

    func actionGoToWebView() {
        let webV = WebViewController()
        webV.heroURLP = url
        self.navigationController?.pushViewController(webV, animated: true)
        
    }
    
    func actionSaveButton() {
        print("Deu certo delegate")

        let salvandoNaClass = SaveHerosApi.init(name: name ?? "", descripion: desciçao ?? "", urlImage: imageHeros ?? "")
        hm.addHero(salvandoNaClass)
        
        
        
        self.alert?.getAlert(titulo: "Heroi Salvo", mensagem: "Erois exibidos na tela inicial")
    }
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
