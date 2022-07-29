import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let backButton = UIButton()
    let loginLabel = UILabel()
    let textFieldLogin = UITextField()
    let textFieldPassword = UITextField()
    let loginButton = UIButton()
    var activeTextField : UITextField? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpLoginView()
        setUpFields()
        setUpButton()
        setUpSpace()
        setUpBackButton()
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

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
    
    func setUpLoginView() {
        view.addSubview(loginLabel)
        loginLabel.backgroundColor = .white
        loginLabel.text = "Log in"
        loginLabel.font = UIFont(name: "Poppins-SemiBold", size: 25)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setUpFields() {
        [textFieldLogin, textFieldPassword].forEach({
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
        textFieldPassword.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
            textFieldLogin.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 10),
        ])
    }
    
    private func setUpButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 1)
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            loginButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 130),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setUpSpace () {
        let spacerOne = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        textFieldLogin.leftViewMode = UITextField.ViewMode.always
        textFieldLogin.leftView = spacerOne
        let spacerTwo = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        textFieldPassword.leftViewMode = UITextField.ViewMode.always
        textFieldPassword.leftView = spacerTwo
    }
    
    @objc func backHome() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func loginTapped() {
        let viewController = StassyProfileViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
}



extension LoginViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboardView() {
        view.endEditing(true)
        self.view.frame.origin.y = 0
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        self.view.frame.origin.y = 0 - keyboardSize.height/2
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}
