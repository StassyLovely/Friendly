import Foundation
import UIKit


class MentorsInterestsProfileViewController: UIViewController {

    let backButton = UIButton()
    let loginLabel = UILabel()
    let nextButton = UIButton()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let items = [InterestManager.interest]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackButton()
        setUpLoginLabel()
        setUpNextStepButton()
        
        setUpCollectionView()
        configCollectionView()
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
        let viewController = UserViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    func setUpLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.backgroundColor = .white
        loginLabel.numberOfLines = 0
        loginLabel.text = "What do you want to tell about?"
        loginLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setUpNextStepButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        nextButton.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 1)
        nextButton.setTitle("Next step", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 20
        nextButton.addTarget(self, action: #selector(profileGo), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func profileGo() {
        let tabBarVC = UITabBarController()
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem.init(title: "home", image: UIImage(named: "home"), tag: 0)
        let mentorsProfileVC = UINavigationController(rootViewController: MyMentorsProfileViewController())
        mentorsProfileVC.title = "Profile"
        tabBarVC.setViewControllers([homeVC,mentorsProfileVC], animated: false)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        
        
        let viewController = HomeViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    private func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        view.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    private func configCollectionView() {
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


extension MentorsInterestsProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items[section].count
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        let interest = items[indexPath.section][indexPath.row]
        cell.configure(with: interest)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap")
//        let currentUser = items[indexPath.section][indexPath.row]
    }
}


extension MentorsInterestsProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width / 2 - 16, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
}



