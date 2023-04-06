//
//  SaveHeroTableViewCell.swift
//  ProjComicsMarvel
//
//  Created by test on 22/03/23.
//

import UIKit

class SaveHeroTableViewCell: UITableViewCell {
    
    
    static let identifier: String = "SaveHeroTableViewCell"
    
    let hm = HerosMenager.shared
    
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
        num.contentMode = .scaleAspectFit
        num.textColor = .white
        return num
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
    }
    
    public func setUpCell(salvandoHero: SaveHerosApi){
        self.nameLabel.text = salvandoHero.name
        self.descriHero.text = salvandoHero.descripion
        
        if let url = URL(string: salvandoHero.urlImage){
            self.imageHero.kf.indicatorType = .activity //load da imagem
            self.imageHero.kf.setImage(with: url)
        }else{
            self.imageHero.image = nil
        }
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
            self.descriHero.leadingAnchor.constraint(equalTo: self.imageHero.trailingAnchor, constant: 20)
            
        ])
    }
}
