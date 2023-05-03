//
//  BarraNav.swift
//  ProjComicsMarvel
//
//  Created by test on 03/03/23.
//

import UIKit

enum TypeListHerosOrListSaveHeros{
    case listaHeros
    case listaSaveHeros
}

protocol BarraNavDelegate: AnyObject{
    func loadHeros(isSearch: Bool)
    func typeScrem(type: TypeListHerosOrListSaveHeros)
}

class BarraNavegaView: UIView {
    
    weak var delegate: BarraNavDelegate?
    
    func delegate(delegate: BarraNavDelegate?){
        self.delegate = delegate
    }
    
    
    lazy var navBackGroudView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        //aredondamento
        view.layer.cornerRadius = 0
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var navBar:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var searchBar:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.placeholder = "Digite aqui"
        textF.backgroundColor = .darkGray
        textF.textColor = .black
        return textF
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedPesquisaButton), for: .touchUpInside)
        return button
    }()
    
    let stackView:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    lazy var listHerrosButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(self.tappedListaButton), for: .touchUpInside)
        return button
    }()
    
    lazy var saveHerosButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "group")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(self.tappedHerosSaveButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedListaButton(){
        self.delegate?.typeScrem(type: .listaHeros)
        self.listHerrosButton.tintColor = .systemPink
        self.saveHerosButton.tintColor = .black
    }
    @objc func tappedHerosSaveButton(){
        self.delegate?.typeScrem(type: .listaSaveHeros)
        self.saveHerosButton.tintColor = .systemPink
        self.listHerrosButton.tintColor = .black
    }
    
    @objc func tappedPesquisaButton(){
        print("Botão de pesquisa precionado")
        self.saveHerosButton.tintColor = .systemPink
        self.listHerrosButton.tintColor = .black
        self.delegate?.loadHeros(isSearch: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElemented()
        self.setUpdaConstraints()
    }
        
    func addElemented(){
        self.addSubview(self.navBackGroudView)
        self.navBackGroudView.addSubview(self.navBar)
        self.navBar.addSubview(self.searchBar)
        self.navBar.addSubview(self.stackView)
        self.searchBar.addSubview(self.searchTextField)
        self.searchBar.addSubview(self.searchButton)
        self.stackView.addArrangedSubview(self.listHerrosButton)
        self.stackView.addArrangedSubview(self.saveHerosButton)
    }
    
    func setUpdaConstraints() {
        NSLayoutConstraint.activate([
            
            self.navBackGroudView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBackGroudView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBackGroudView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navBackGroudView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.searchBar.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor,constant: 30),
            self.searchBar.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.stackView.leadingAnchor,constant: -20),
            self.searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            self.stackView.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -30),
            self.stackView.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalToConstant: 100),
            self.stackView.heightAnchor.constraint(equalToConstant: 30),
            
            self.searchTextField.leadingAnchor.constraint(equalTo: self.searchBar.leadingAnchor, constant: 25),
            self.searchTextField.centerYAnchor.constraint(equalTo: self.searchBar.centerYAnchor),
            
            self.searchButton.trailingAnchor.constraint(equalTo: self.searchBar.trailingAnchor, constant: -20),
            self.searchButton.centerYAnchor.constraint(equalTo: self.searchBar.centerYAnchor),
            self.searchButton.widthAnchor.constraint(equalToConstant: 20),
            self.searchButton.heightAnchor.constraint(equalToConstant: 20)
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


