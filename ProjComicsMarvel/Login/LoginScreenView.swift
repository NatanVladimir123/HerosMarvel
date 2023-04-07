//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by test on 23/01/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreenView: UIView {
    
    weak private var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }

    // lazy só é lido quando é chamado
    lazy var loginLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // habilita a função para nos darmos a nossas constraints
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logoMarvel")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tField = UITextField()
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.autocorrectionType = .no //autocorreção das palavras
        tField.backgroundColor = .white
        tField.borderStyle = .roundedRect
        tField.keyboardType = .emailAddress
        tField.placeholder = "E-mail: "
        tField.text = "Nata@gmail.com"
        tField.textColor = .black
        return tField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passField = UITextField()
        passField.translatesAutoresizingMaskIntoConstraints = false
        passField.autocorrectionType = .no
        passField.backgroundColor = .white
        passField.borderStyle = .roundedRect
        passField.keyboardType = .default
        passField.placeholder = "Senha: "
        passField.text = "123456"
        passField.isSecureTextEntry = true
        passField.textColor = .black
        return passField
    }()
    
    lazy var loginButton: UIButton = {
        let logButton = UIButton()
        logButton.translatesAutoresizingMaskIntoConstraints = false
        logButton.setTitle("Logar", for: .normal)
        logButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        logButton.setTitleColor(.white, for: .normal) // cor do texto
        logButton.clipsToBounds = true // deixar o botão redondo
        logButton.layer.cornerRadius = 7.5 // deixar as bordas arredondadas
        logButton.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        logButton.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return logButton
    }()
    
    lazy var registerButton: UIButton = {
        let regButton = UIButton()
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.setTitle("Primeira vez? Cadastre-se.", for: .normal)
        regButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        regButton.setTitleColor(.white, for: .normal)
        regButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return regButton
    }()
    
    //construtor
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setUpConstraints()
        self.habilitaButton(habilita: false)
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView(){
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    //configurando as texts Field
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    //metodo OBJC para ação do botão
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields(){
        guard let email: String = emailTextField.text, let password: String = passwordTextField.text else {return}
        
        if !email.isEmpty && !password.isEmpty{
            self.habilitaButton(habilita: true)
        }else{
            self.habilitaButton(habilita: false)
        }
    }
    
    private func habilitaButton(habilita: Bool){
        if habilita{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true //hablitado
        }else{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    func getEmail() -> String{
        return emailTextField.text ?? ""
    }
    func getPassword() -> String{
        return passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //equal to:
    //basear em um determinado elemento
    
    //constant:
    // me affastar ou aproximar de elemento referente (equalto)
    
    //equalToConstatatn:
    //setando um valor fixo para um determinado elemento
    
    private func setUpConstraints(){
      NSLayoutConstraint.activate([
            //Label
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //Logo
            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
            //Text field Email
            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            //Text Field Senha
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            //butão de login
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            //botão de cadastro
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor)
       ])
   }
}
