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
    var hrUrl: Hero!
    
    override func loadView() {
        self.descriptionView = DescriptionView()
        self.view = self.descriptionView
        
        self.descriptionView?.nameLabel.text = hrUrl.name
        self.descriptionView?.descriHeroLabel.text = hrUrl.description
        if let url = URL(string: hrUrl.thumbnail.url){
            descriptionView?.imageHero.kf.indicatorType = .activity //load da imagem
            descriptionView?.imageHero.kf.setImage(with: url)
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
        
        webV.heroURLP = String(hrUrl.urls.first!.url)
        print("\n----url----\n", String(hrUrl.urls.first!.url), "\n-------")
        self.navigationController?.pushViewController(webV, animated: true)
        
    }
    
    func actionSaveButton() {
        print("Deu certo delegate")

        let salvandoNaClass = SaveHerosApi.init(name: hrUrl.name, descripion: hrUrl.description, urlImage: hrUrl.thumbnail.url)
        hm.addHero(salvandoNaClass)
        
        self.alert?.getAlert(titulo: "Heroi Salvo", mensagem: "Erois exibidos na tela inicial")
    }
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
