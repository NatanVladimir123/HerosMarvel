//
//  AlertaPopUp.swift
//  LoginViewCode
//
//  Created by test on 01/02/23.
//

import Foundation
import UIKit

class Alert:NSObject{
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(titulo: String, mensagem: String, complition:(() -> Void)? = nil) {
        let alertController = UIAlertController.init(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "OK", style: .cancel) { acao in
            complition?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController,animated: true,completion: nil)
    }
}
