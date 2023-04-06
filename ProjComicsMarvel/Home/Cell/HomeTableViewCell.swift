//
//  HomeTableViewCell.swift
//  ProjComicsMarvel
//
//  Created by test on 01/03/23.
//

import UIKit
import Kingfisher
import Foundation

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = "HomeTableViewCell"
    
    lazy var imageHero: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = image.frame.size.height / 2
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 2
        return image
    }()

    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.contentMode = .scaleAspectFit
        name.textColor = .white
        return name
    }()
    
    lazy var descriHero: UILabel = {
        let num = UILabel()
        num.translatesAutoresizingMaskIntoConstraints = false
        num.numberOfLines = 0
        num.contentMode = .scaleAspectFit
        num.textColor = .white
        return num
    }()
    
    lazy var heroSaveButton: UIButton = {
        let buttom = UIButton()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setImage(UIImage(named: "star"), for: .normal)
        buttom.addTarget(self, action: #selector(self.tappedStarSaveButton), for: .touchUpInside)
        return buttom
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addElementos()
        self.setUpConstraints()
        self.configBackGroudColor()
    }
    
    
    private func addElementos(){
        self.contentView.addSubview(self.imageHero)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.descriHero)
        self.contentView.addSubview(self.heroSaveButton)
    }
    
    public func setUpCell(herois: Hero){
        self.nameLabel.text = herois.name
        self.descriHero.text = herois.description
        if let url = URL(string: herois.thumbnail.url){
            imageHero.kf.indicatorType = .activity //load da imagem
            imageHero.kf.setImage(with: url)
        }else{
            imageHero.image = nil
        }
        
    }
    
    @objc func tappedStarSaveButton(){
        print("Botão indacador de heroi salvo na ista precionado")
    }
    
    private func configBackGroudColor(){
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            self.imageHero.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageHero.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageHero.heightAnchor.constraint(equalToConstant: 80),
            self.imageHero.widthAnchor.constraint(equalToConstant: 80),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.imageHero.trailingAnchor, constant: 20),
            
            self.descriHero.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            self.descriHero.leadingAnchor.constraint(equalTo: self.imageHero.trailingAnchor, constant: 20),
            self.descriHero.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            self.heroSaveButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.heroSaveButton.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.heroSaveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
            
        ])
    }
    
}
