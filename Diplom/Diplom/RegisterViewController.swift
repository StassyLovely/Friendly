import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    let backButton = UIButton()
    let loginLabel = UILabel()
    let textFieldLogin = UITextField()
    let textFieldPassword = UITextField()
    let textFieldPasswordConfirm = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackButton()
        setUpLoginView()
        setupNextButton()
        setUpFields()
        setUpSpace()
        view.backgroundColor = .white
        
    }
    
    
    func setUpBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backHome), for: .touchUpInside)
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
    
    @objc func backHome() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    
    func setUpLoginView() {
        view.addSubview(loginLabel)
        loginLabel.backgroundColor = .white
        loginLabel.text = "Sign up"
        loginLabel.font = UIFont(name: "Poppins-SemiBold", size: 25)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setUpFields() {
        [textFieldLogin, textFieldPassword, textFieldPasswordConfirm].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
            
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                $0.heightAnchor.constraint(equalToConstant: 40)
            ])
        })
        textFieldLogin.placeholder = "Telephone number/e-mail"
        textFieldPassword.placeholder = "Password"
        textFieldPasswordConfirm.placeholder = "Confirm password"
        textFieldPassword.isSecureTextEntry = true
        textFieldPasswordConfirm.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
            textFieldLogin.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 10),
            textFieldPasswordConfirm.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10)
        ])
    }
    
    private func setupNextButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 1)
        loginButton.setTitle("Sign up", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(userShow), for: .touchUpInside)
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func userShow() {
        let viewController = UserViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    func setUpSpace () {
        let spacerOne = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        textFieldLogin.leftViewMode = UITextField.ViewMode.always
        textFieldLogin.leftView = spacerOne
        let spacerTwo = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        textFieldPassword.leftViewMode = UITextField.ViewMode.always
        textFieldPassword.leftView = spacerTwo
        let spacerThree = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        textFieldPasswordConfirm.leftViewMode = UITextField.ViewMode.always
        textFieldPasswordConfirm.leftView = spacerThree
    }
}
