//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by test on 27/01/23.
//

import UIKit

protocol RegisterScrrenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
    
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScrrenProtocol?
    
    func delegate (delegate: RegisterScrrenProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
       let voltar = UIButton()
        voltar.translatesAutoresizingMaskIntoConstraints = false
        voltar.setTitle("Voltar", for: .normal)
        voltar.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return voltar
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTf = UITextField()
        emailTf.translatesAutoresizingMaskIntoConstraints = false
        emailTf.autocorrectionType = .no
        emailTf.backgroundColor = .white
        emailTf.borderStyle = .roundedRect
        emailTf.keyboardType = .emailAddress
        emailTf.placeholder = "Digite Seu e-mail"
        emailTf.font = UIFont.systemFont(ofSize: 14)
        emailTf.textColor = .black
        return emailTf
    }()
    
    lazy var passwordTextField: UITextField = {
        let passTf = UITextField()
        passTf.translatesAutoresizingMaskIntoConstraints = false
        passTf.autocorrectionType = .no
        passTf.backgroundColor = .white
        passTf.borderStyle = .roundedRect
        passTf.keyboardType = .default
        passTf.isSecureTextEntry = true
        passTf.placeholder = "Digite sua senha:"
        passTf.textColor = .darkGray
        return passTf
    }()
    
    lazy var registerButton: UIButton = {
        let regButton = UIButton()
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.setTitle("Cadastrar", for: .normal)
        regButton.setTitleColor(.white, for: .normal)
        regButton.clipsToBounds = true
        regButton.layer.cornerRadius = 7.5
        regButton.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        regButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return regButton
    }()
    
    //construtor padão 1°
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackgGroud()
        self.configSuperView()
      //  ----------------------
        self.setUpContrainsts()
      //  ---------------------
        self.habilitaButton(false)

    }
    
    // **** colocar todos objetos aqui ****
    private func configSuperView(){
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate  = delegate
    }
    
    
   // ***** cor de fundo *****
    private func configBackgGroud(){
        self.backgroundColor = UIColor.darkGray
    }
    
    //*** voltar
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
    //*** cadastrar
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
   public func validaTextFields(){ //tentado validando se tem caracter no botão
        
        guard let email: String = emailTextField.text, let password: String = passwordTextField.text else { return }//desenbrulhando as var opicionais
        
        if !email.isEmpty && !password.isEmpty{
            self.habilitaButton(true)
        }else{
            self.habilitaButton(false)
        }
    }
    
    private func habilitaButton(_ habilita: Bool){
        if habilita{
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true //hablitado
        }else{
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
            
    }
    
    //func returno as variaveis para cadastro *******
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.passwordTextField.text ?? ""
    }
    // ****************
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContrainsts(){
        NSLayoutConstraint.activate([
        
            //imagem
            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            //botão de voltar
            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            //Email (abaixo da imagem)
            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            //senha (abaixo do email com base nos parametros do email
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            //botão de cadastro abaixo da senha
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 25),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor)
        ])
    }
   

    
}

