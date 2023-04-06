//
//  ViewController.swift
//  ProjComicsMarvel
//
//  Created by test on 28/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView = HomeView()
    var name: String?
    let hm = HerosMenager.shared
    var loadingHeros = false
    var pagAtual = 0
    var total = 0
    
    //------
    var screemHeros = false 
    var heros: [Hero] = []
    
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableViewDelegate()
        self.configPesquisaDelegate()
        
        
        if name == nil{
            self.loadHeros()
        }else if name?.isEmpty != true{
            self.loadHeros()
        }else{
            self.loadHeros()
        }
        // carregando herois
    }
    
    //delegateBotão de pesquisa
    private func configPesquisaDelegate(){
        self.homeView.navView.delegate(delegate: self)
    }
    //delegate TableView
    private func configTableViewDelegate(){
        self.homeView.configTableViewDelegate(delegate: self, dataSource: self)
    }
    
    
    func loadHeros(isSearch: Bool = false){
        
        loadingHeros = true
        MarvelApi.loadHeros(name: name,page: pagAtual) { info in
            if let info = info{
                if isSearch{
                    self.heros = info.data.results//adcionando contagem dos herios
                }else{
                    self.heros += info.data.results
                }
                
                self.total = info.data.total //verificando se chegou ao total
                print("total", self.total)
                print("herois adicionados", self.heros.count)
                DispatchQueue.main.async {
                    self.loadingHeros = false
                    self.homeView.tableViewComics.reloadData()
                }
            }
        }
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.screemHeros {
            return hm.herosS.count
            
        }else{
            return self.heros.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.screemHeros {
            
            guard let cell: SaveHeroTableViewCell = tableView.dequeueReusableCell(withIdentifier: SaveHeroTableViewCell.identifier, for: indexPath) as? SaveHeroTableViewCell else {return UITableViewCell()}
            cell.setUpCell(salvandoHero: self.hm.herosS[indexPath.row])
            return cell
        }else{
            guard let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
            cell.setUpCell(herois: self.heros[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("-celula lista herois selecionada-")
        if self.screemHeros == false{
            let selectedHero = heros[indexPath.row]
            let detailViewController = DescriptionViewController()
            detailViewController.heroObj = heros[tableView.indexPathForSelectedRow?.row ?? 1]
            // montando url para web view
            detailViewController.url = String(selectedHero.urls.first!.url).lowercased()
            print("url --- ",String(selectedHero.urls.first!.url))
            
            // encaminhando variaveis para descripitionController
            detailViewController.name = selectedHero.name
            detailViewController.desciçao = selectedHero.description
            detailViewController.imageHeros = selectedHero.thumbnail.url
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
            print()
            
        }else{
            print("Heroi salvo selecionado")
            let selectedHero = hm.herosS[indexPath.row]
            let webVc = WebViewController()
           // webVc.hero = self.hm.herosS[tableView.indexPathForSelectedRow!.row]
           
            self.navigationController?.pushViewController(WebViewController(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.screemHeros == true{
            if indexPath.row == heros.count - 10 && !loadingHeros && heros.count != total{
                pagAtual += 1
                loadHeros()
                print("carregando mais herois")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if screemHeros{
            if editingStyle == .delete{
                hm.removeHero(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .bottom)
            }
        }else{
            tableView.delegate = false  as? any UITableViewDelegate
        }
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
       if screemHeros{
           return UITableViewCell.EditingStyle.delete
        } else {
            return UITableViewCell.EditingStyle.none
        }
    }
    
}

extension HomeViewController: BarraNavDelegate{
    func typeScrem(type: TypeListHerosOrListSaveHeros) {
        switch type {
        case .listaHeros:
            self.screemHeros = false
            self.homeView.reloadTableView()
        case .listaSaveHeros:
            self.screemHeros = true
            self.homeView.reloadTableView()
        }
    }
    
    
    func actionPesquisaButton() {
        print("Deu certo botao de pesquisa")
        name = self.homeView.navView.searchTextField.text
        loadHeros(isSearch: true)
    }
    
    
}
