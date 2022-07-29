import Foundation
import UIKit


class MyMentorsProfileViewController: UIViewController {
    
    let userPhotoView = UIImageView()
    let nameLabel = UILabel()
    let infoLabel = UILabel()
    let interestsLabel = UILabel()
    let interestsPresent = UILabel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPhotoView()
        setUpNameLabel()
        setUpInfoLabel()
        setUpInterestsLabel()
        setUpInterestsPresentLabel()
        view.backgroundColor = .white
        
        title = "Profile"
        

    }
    
    func setupPhotoView() {
        view.addSubview(userPhotoView)
        userPhotoView.translatesAutoresizingMaskIntoConstraints = false
        userPhotoView.backgroundColor = .white
        userPhotoView.image = UIImage(named: "menmentor")
        userPhotoView.contentMode = .scaleAspectFit
        userPhotoView.clipsToBounds = true
        userPhotoView.contentMode = .center
        
        NSLayoutConstraint.activate([
            userPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userPhotoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            userPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userPhotoView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setUpNameLabel() {
        view.addSubview(nameLabel)
      nameLabel.backgroundColor = .white
      nameLabel.text = "Christopher Hemsworth"
      nameLabel.textAlignment = .left
      nameLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
      nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           nameLabel.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 10),
           nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
           nameLabel.widthAnchor.constraint(equalToConstant: 300),
           nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setUpInfoLabel() {
        view.addSubview(infoLabel)
     infoLabel.backgroundColor = .white
     infoLabel.numberOfLines = 0
     infoLabel.text = "I was interested in cinema all my life. I can tell everything about cinema. Christopher Hemsworth was born on August 11, 1983 in Melbourne, Victoria, Australia to Leonie Hemsworth (née van Os), an English teacher & Craig Hemsworth, a social-services counselor. His brothers are actors, Liam Hemsworth & Luke Hemsworth; he is of Dutch ancestry."
     infoLabel.textAlignment = .left
     infoLabel.font = UIFont(name: "Poppins-ExtraLight", size: 12)
     infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
          infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
          infoLabel.widthAnchor.constraint(equalToConstant: 250),
          infoLabel.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func setUpInterestsLabel() {
        view.addSubview(interestsLabel)
     interestsLabel.backgroundColor = .white
     interestsLabel.text = "Interests"
     interestsLabel.textAlignment = .left
     interestsLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
     interestsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          interestsLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
          interestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
          interestsLabel.widthAnchor.constraint(equalToConstant: 200),
          interestsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setUpInterestsPresentLabel() {
        view.addSubview(interestsPresent)
        interestsPresent.backgroundColor = .white
        interestsPresent.layer.borderWidth = 1
        interestsPresent.layer.borderColor = UIColor.black.cgColor
        interestsPresent.text = "cinema"
        interestsPresent.textAlignment = .center
        interestsPresent.font = UIFont(name: "Poppins-SemiBold", size: 10)
        interestsPresent.layer.cornerRadius = 10
        interestsPresent.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
         interestsPresent.topAnchor.constraint(equalTo: interestsLabel.bottomAnchor, constant: 10),
         interestsPresent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
         interestsPresent.widthAnchor.constraint(equalToConstant: 100),
         interestsPresent.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
