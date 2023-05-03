//
//  DescriptionView.swift
//  ProjComicsMarvel
//
//  Created by test on 10/03/23.
//

import UIKit

protocol DescriptionViewDelegate: AnyObject{
    func actionBackButton()
    func actionSaveButton()
    func actionGoToWebView()
}

class DescriptionView: UIView {
    
    weak var delegate: DescriptionViewDelegate?
    
    
    func delegate(delegate: DescriptionViewDelegate?){
        self.delegate = delegate
    }
    
    lazy var imageHero: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    lazy var backButton: UIButton = {
       let voltar = UIButton()
        voltar.translatesAutoresizingMaskIntoConstraints = false
        voltar.setImage(UIImage(named: "back"), for: .normal)
        voltar.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return voltar
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.contentMode = .scaleAspectFit
        name.textColor = .white
        name.textAlignment = .center
        return name
    }()
    
    lazy var descriHeroLabel: UILabel = {
        let num = UILabel()
        num.translatesAutoresizingMaskIntoConstraints = false
        num.numberOfLines = 0
        num.contentMode = .scaleAspectFit
        num.textColor = .white
        num.textAlignment = .center
        return num
    }()
    
    lazy var saveHeroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemPink
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitle("Salvar", for: .normal)
        button.addTarget(self, action: #selector(self.tappedSaveButton), for: .touchDown)
        return button
    }()
    
    lazy var goToWebViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemPink
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitle("Ver descrição completa", for: .normal)
        button.addTarget(self, action: #selector(self.tappedGoToWebView), for: .touchDown)
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBakGroundColor()
        self.addElementos()
        self.setUpContraints()
        
    }
    
    private func addElementos(){
        self.addSubview(self.backButton)
        self.addSubview(self.imageHero)
        self.addSubview(self.nameLabel)
        self.addSubview(self.descriHeroLabel)
        self.addSubview(self.saveHeroButton)
        self.addSubview(self.goToWebViewButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBakGroundColor(){
        self.backgroundColor = .darkGray
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedGoToWebView(){
        self.delegate?.actionGoToWebView()
    }
    
    @objc private func tappedSaveButton(){
        self.delegate?.actionSaveButton()
        print("Botão precionado")
        
    }
   
    
    private func setUpContraints(){
        NSLayoutConstraint.activate([
            
            self.imageHero.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageHero.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageHero.widthAnchor.constraint(equalToConstant: 150),
            self.imageHero.heightAnchor.constraint(equalToConstant: 150),
            
            //botão de voltar
            self.backButton.topAnchor.constraint(equalTo: self.imageHero.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.imageHero.bottomAnchor, constant: 30),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 45),
            
            self.descriHeroLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 30),
            self.descriHeroLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.descriHeroLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.descriHeroLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            self.saveHeroButton.topAnchor.constraint(equalTo: self.descriHeroLabel.bottomAnchor, constant: 30),
            self.saveHeroButton.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.saveHeroButton.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.saveHeroButton.heightAnchor.constraint(equalTo: self.nameLabel.heightAnchor),
            
            self.goToWebViewButton.topAnchor.constraint(equalTo: self.saveHeroButton.bottomAnchor, constant: 30),
            self.goToWebViewButton.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.goToWebViewButton.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.goToWebViewButton.heightAnchor.constraint(equalTo: self.nameLabel.heightAnchor),
          
        ])
    }
    
}
