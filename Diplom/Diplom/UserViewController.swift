import Foundation
import UIKit

class UserViewController: UIViewController {
    
    let backButton = UIButton()
    let loginLabel = UILabel()
    let listenerButton = UIButton()
    let mentorButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpBackButton()
        setUpLoginLabel()
        setUpChooseView()
        
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
    
    func setUpLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.backgroundColor = .white
        loginLabel.text = "Who are you?"
        loginLabel.font = UIFont(name: "Poppins-SemiBold", size: 25)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    
    func setUpChooseView() {
        view.addSubview(listenerButton)
        view.addSubview(mentorButton)
        mentorButton.translatesAutoresizingMaskIntoConstraints = false
        listenerButton.translatesAutoresizingMaskIntoConstraints = false
        
        listenerButton.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 1)
        mentorButton.backgroundColor = .black
        
        listenerButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        listenerButton.setTitleColor(.white, for: .normal)
        listenerButton.layer.cornerRadius = 20
        listenerButton.setTitle("Listener", for: .normal)
        listenerButton.addTarget(self, action: #selector(goListener), for: .touchUpInside)
        
        mentorButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        mentorButton.setTitleColor(.white, for: .normal)
        mentorButton.layer.cornerRadius = 20
        mentorButton.setTitle("Mentor", for: .normal)
        mentorButton.addTarget(self, action: #selector(goMentor), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            listenerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listenerButton.heightAnchor.constraint(equalToConstant: 50),
            listenerButton.widthAnchor.constraint(equalToConstant: 150),
            listenerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
           mentorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           mentorButton.heightAnchor.constraint(equalToConstant: 50),
           mentorButton.widthAnchor.constraint(equalToConstant: 150),
           mentorButton.topAnchor.constraint(equalTo: listenerButton.bottomAnchor, constant: 10),
        ])
    }
    
    @objc func goMentor() {
        let viewController = NewMentorViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func goListener() {
        let viewController = NewListenerViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}
