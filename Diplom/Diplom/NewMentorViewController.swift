import Foundation
import UIKit

class NewMentorViewController: UIViewController {
    
    let backButton = UIButton()
    let loginLabel = UILabel()
    let nextStepButton = UIButton()
    
    let userPhotoView = UIImageView()
    let userPickerController = UIImagePickerController()
    
    let nameLabel = UILabel()
    let nameField = UITextField()
    let surnameField = UITextField()
    
    let aboutLabel = UILabel()
    let aboutField = UITextField()
    
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackButton()
        setUpLoginLabel()
        setupPhotoView()
        photoUserTap()
        setUpNameLabel()
        setUpFields()
        setUpSpace()
        setUpAboutLabel()
        setUpAboutField()
        setUpNextStepButton()
        
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
        let viewController = UserViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    func setUpLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.backgroundColor = .white
        loginLabel.text = "Add your photo"
        loginLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupPhotoView() {
        view.addSubview(userPhotoView)
        userPhotoView.translatesAutoresizingMaskIntoConstraints = false
        userPhotoView.backgroundColor = .white
        userPhotoView.layer.borderColor = UIColor.black.cgColor
        userPhotoView.layer.borderWidth = 1
        userPhotoView.layer.cornerRadius = 15
        userPhotoView.image = UIImage(named: "add")
        userPhotoView.contentMode = .center
        
        NSLayoutConstraint.activate([
            userPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userPhotoView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor),
            userPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            userPhotoView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func photoUserTap() {
        let tapPicture = UITapGestureRecognizer(target: self, action: #selector(tapPicUser))
        userPhotoView.isUserInteractionEnabled = true
        userPhotoView.addGestureRecognizer(tapPicture)
    }
    
    @objc func tapPicUser() {
        showAlert()
    }
    
    private func showAlert() {
        let alertVC = UIAlertController(title: "Picker photo", message: "Chose for from the library or camera", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            let imagePicker = self.createImagePicker(sourceType: .camera)
            self.present(imagePicker, animated: true) {
                imagePicker.delegate = self
            }
        }
        
        let photoLibrary = UIAlertAction(title: "Photo library", style: .default) { _ in
            let imagePicker = self.createImagePicker(sourceType: .photoLibrary)
            self.present(imagePicker, animated: true) {
                imagePicker.delegate = self
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertVC.addAction(cameraAction)
        alertVC.addAction(photoLibrary)
        alertVC.addAction(cancel)
        
        present(alertVC, animated: true)
        
    }
    
    func createImagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.allowsEditing = true
        return pickerController
    }
    
    func setUpNameLabel() {
        view.addSubview(nameLabel)
       nameLabel.backgroundColor = .white
       nameLabel.text = "Name and surname"
       nameLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
       nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           nameLabel.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor),
           nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           nameLabel.widthAnchor.constraint(equalToConstant: 250),
           nameLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setUpFields() {
        [nameField, surnameField].forEach({
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
        nameField.placeholder = "Name"
        surnameField.placeholder = "Surname"
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
        ])
    }
    
    func setUpAboutLabel() {
        view.addSubview(aboutLabel)
        aboutLabel.backgroundColor = .white
        aboutLabel.text = "About you"
        aboutLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: surnameField.bottomAnchor),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aboutLabel.widthAnchor.constraint(equalToConstant: 200),
            aboutLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setUpAboutField() {
        view.addSubview(aboutField)
        aboutField.translatesAutoresizingMaskIntoConstraints = false
        aboutField.backgroundColor = .white
        aboutField.layer.borderColor = UIColor.black.cgColor
        aboutField.layer.borderWidth = 1
        aboutField.layer.cornerRadius = 10
        aboutField.placeholder = "Tell us about yourself"
        
        NSLayoutConstraint.activate([
            aboutField.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor),
            aboutField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aboutField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            aboutField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    func setUpSpace () {
        let spacerOne = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        nameField.leftViewMode = UITextField.ViewMode.always
        nameField.leftView = spacerOne
        let spacerTwo = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        surnameField.leftViewMode = UITextField.ViewMode.always
        surnameField.leftView = spacerTwo
        let spacerThree = UIView(frame:CGRect(x:0, y:0, width:20, height:10))
        aboutField.leftViewMode = UITextField.ViewMode.always
        aboutField.leftView = spacerThree
    }
    
    private func setUpNextStepButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        nextButton.backgroundColor = UIColor(red: 88/255.0, green: 169/255.0, blue: 245/255.0, alpha: 1)
        nextButton.setTitle("Next step", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 20
        nextButton.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func nextStep() {
        let viewController = MentorsInterestsProfileViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
}



extension NewMentorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            userPhotoView.image = image
            userPhotoView.layer.masksToBounds = true
        }
        dismiss(animated: true)
    }
}
