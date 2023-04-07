//
//  LoginViewModel.swift
//  ProjComicsMarvel
//
//  Created by Bruno Andrade on 2023-04-06.
//

import Foundation
import Firebase


class LoginViewModel {
    var auth: Auth
    
    init(auth: Auth = Auth.auth()) {
        self.auth = auth
        
        
    }
    
    //TODO: Adicionar mais casos de erro no completion
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        self.auth.signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                completion(false)
                return
            } else {
                if user == nil {
                    completion(false)
                    return
                } else {
                    completion(true)
                }
                
            }
        }
    }
}
