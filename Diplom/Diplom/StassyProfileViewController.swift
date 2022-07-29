//UIFont.familyNames.forEach { familyname in
//    let familyNames = UIFont.fontNames(forFamilyName: familyname)
//    print(familyname, familyNames)
//}


import Foundation
import UIKit


class StassyProfileViewController: UIViewController {

let mentorsPhotoView = UIImageView()
let mentorsLabelView = UILabel()
let mentorsInfoLabel = UILabel()
let mentorsInterestsLabel = UILabel()
let mentorsInterestsInfoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModeling()
    }
 
    func viewModeling() {
        view.backgroundColor = .white
        view.addSubview(mentorsPhotoView)
        mentorsPhotoView.image = UIImage(named: "mentor")
        mentorsPhotoView.contentMode = .scaleAspectFit
        mentorsPhotoView.translatesAutoresizingMaskIntoConstraints = false
        mentorsPhotoView.backgroundColor = .gray
        NSLayoutConstraint.activate([
            mentorsPhotoView.topAnchor.constraint(equalTo: view.topAnchor),
            mentorsPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mentorsPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mentorsPhotoView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        view.addSubview(mentorsLabelView)
        mentorsLabelView.translatesAutoresizingMaskIntoConstraints = false
        mentorsLabelView.text = "Anastasiya Zhilkina"
        mentorsLabelView.textAlignment = .left
        mentorsLabelView.font = UIFont(name: "Poppins-SemiBold", size: 25)
        NSLayoutConstraint.activate([
            mentorsLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mentorsLabelView.topAnchor.constraint(equalTo: mentorsPhotoView.bottomAnchor),
            mentorsLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            mentorsLabelView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
    

}


