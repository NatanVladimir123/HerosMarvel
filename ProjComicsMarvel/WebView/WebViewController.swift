//
//  WebViewController.swift
//  ProjComicsMarvel
//
//  Created by test on 29/03/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    var backButton: UIButton!
    var heroURLP: String?
    var loadingIndicator: UIActivityIndicatorView!
    
    
    override func loadView() {
        super.loadView()
        // web View
        webView = WKWebView(frame: .zero)
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = false
        view = webView
        
        // botão de voltar
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(backButton)
        
        // Ativar constraints WKWebView e do botão de voltar
        webView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Configure the loading indicator
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.color = .gray
        loadingIndicator.hidesWhenStopped = true
        view.addSubview(loadingIndicator)
        loadingIndicator.center = view.center
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Carregar a URL na WKWebView
        let url = URL(string: heroURLP ?? "")!
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
    
    // Método para voltar na navegação da webview
    @objc func goBack() {
        print("Botão precionado")
        if webView.canGoBack {
            webView.goBack()
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
        print("loading final ")
    }
    
}


