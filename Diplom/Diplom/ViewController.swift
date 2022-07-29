import UIKit

class ViewController: UIViewController {
    
    var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = UIFont(name: "Poppins-SemiBold", size: 25)
        return welcomeLabel
    }()
    
    var welcomeInfoLabel: UILabel = {
        let welcomeInfoLabel = UILabel()
        welcomeInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeInfoLabel.text = "Nice to meet you in this app. We wish you a great way to your education"
        welcomeInfoLabel.numberOfLines = 0
        welcomeInfoLabel.font = UIFont(name: "Poppins-ExtraLight", size: 15)
        return welcomeInfoLabel
    }()
    
    
    lazy var helloImageView: UIImageView = {
        let helloImageView = UIImageView()
       helloImageView.translatesAutoresizingMaskIntoConstraints = false
       helloImageView.image = UIImage(named: "fon")
        return helloImageView
    }()
    
    lazy var registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 1)
        registrationButton.setTitle("Sign Up", for: .normal)
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.layer.cornerRadius = 20
        registrationButton.addTarget(self, action: #selector(registrationShow), for: .touchUpInside)
        return registrationButton
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .black
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(loginShow), for: .touchUpInside)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        helloImageSetup()

    }
    
    func helloImageSetup() {
        view.addSubview(helloImageView)
        view.addSubview(loginButton)
        view.addSubview(registrationButton)
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeInfoLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 200),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 40),
            welcomeInfoLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            welcomeInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeInfoLabel.widthAnchor.constraint(equalToConstant: 200),
            welcomeInfoLabel.heightAnchor.constraint(equalToConstant: 70),
            
            helloImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            helloImageView.topAnchor.constraint(equalTo: view.topAnchor),
            helloImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            helloImageView.widthAnchor.constraint(equalToConstant: 200),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            registrationButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.widthAnchor.constraint(equalToConstant: 150),
            registrationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func loginShow() {
        let viewController = LoginViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func registrationShow() {
        
        let viewController = RegisterViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

