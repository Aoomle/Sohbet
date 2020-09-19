//
//  SignUpScreen.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 30/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

class SignUpScreen: UIViewController {

  let joinUs = SHLabel(title: "Join Us!", textAlign: .left)
  let signUpLabel = SHLabel(title: "Sign Up", textAlign: .left, fontSize: UIFont.preferredFont(forTextStyle: .subheadline))
   
  let emailTextField = SHTextField(placeHolder: "Enter email address", textFieldType: .emailAddress)
  let passwordTextField = SHTextField(placeHolder: "Enter password", textFieldType: .default, typeOfTextField: true)
   
  let signUpButton = SHButton()
  let termsButton = UIButton(target: self, action: #selector(termsButtonAction), tams: false)
  let profileImageButton = UIButton(target: self, action: #selector(handlePhoto), tams: false)
  
  var isEmailEntered: Bool {
    return !emailTextField.text!.isEmpty
  }
  
  var isPasswordEntered: Bool {
    return !passwordTextField.text!.isEmpty
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationController?.navigationBar.prefersLargeTitles = true
    configureView()
    dismissKeyboardWithTap()
  }
  
  fileprivate func dismissKeyboardWithTap() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
    view.addGestureRecognizer(tap)
  }
  
  
  let signUpHUD = JGProgressHUD(style: .dark)
  
  @objc fileprivate func signUpAction() {
    guard isEmailEntered, let email = emailTextField.text  else {
            showError(message: "Email can't be empty, please enter your email address", buttonTitle: "Ok")
            return
          }
          
    guard isPasswordEntered, let password = passwordTextField.text else {
            showError(message: "Password can't be empty", buttonTitle: "Ok")
            return
          }
          
      guard emailTextField.text!.isEmailVaid else {
            showError(message: "Email validation failed please enter your email address correct", buttonTitle: "Ok")
            return
          }
          
    signUpHUD.textLabel.text = "Signing Up..."
    signUpHUD.show(in: view)
    
    Auth.auth().createUser(withEmail: email, password: password) { (message, err) in
        if let err = err {
          //password character must be 6 character or more
          //network connection problem
          self.startJG(titleError: "Signing Up Failed..", messageError: err.localizedDescription)
          } else {
              print("\(message?.user.email ?? "")")
              self.navigationController?.setNavigationBarHidden(true, animated: true)
              self.navigationController?.pushViewController(TabMenu(), animated: true)
        
          //storage
          guard let image = self.profileImageButton.imageView?.image else { return }
          guard let uploadImage = image.jpegData(compressionQuality: 0.75) else { return }
          let filename = UUID().uuidString
          
          let ref = Storage.storage().reference().child("profile_images").child(filename)
          
          ref.putData(uploadImage, metadata: nil) { (metadata, err) in
            if let err = err {
              self.startJG(titleError: "Signing Up Failed..", messageError: err.localizedDescription)
            }
            
            ref.downloadURL { (imageUrl, err) in
              if let err = err {
                self.startJG(titleError: err.localizedDescription, messageError: "")
                return
              }
              
              print("Downloading of our url image....", imageUrl?.absoluteString ?? "")
              
              //database
                let uid = message?.user.uid
                let dictionaryValues = ["email": email, "profileUrl": imageUrl?.absoluteString ?? ""]
                let values = [uid : dictionaryValues]
                         
                Database.database().reference().child("users").updateChildValues(values) { (err, dataRef) in
                    if let err = err {
                      print("database failed to saved data", err.localizedDescription)
                    }
                    print("Successfully saved into the database")
                           
                }
          }
        }
      }
    }
  }
  
  func startJG(titleError: String, messageError: String) {
    signUpHUD.dismiss(animated: true)
    signUpHUD.detailTextLabel.text = messageError
    signUpHUD.textLabel.text = titleError
    signUpHUD.show(in: self.view)
    signUpHUD.dismiss(afterDelay: 2, animated: true)
  }
  
  @objc fileprivate func handlePhoto() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    present(imagePicker, animated: true, completion: nil)
  }
  
  @objc fileprivate func termsButtonAction() {
    pushToAnotherScreen(title: "Sign Up", viewController: TermsScreen())
  }
  
  fileprivate func pushToAnotherScreen(title: String, viewController: UIViewController) {
    navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  fileprivate func configureView() {
     
    view.addSubview(joinUs)
    view.addSubview(signUpLabel)
    
    view.addSubview(profileImageButton)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
      
    view.addSubview(signUpButton)
    view.addSubview(termsButton)
    
    termsButton.customButton(background: .systemBackground, titleColor: .label, title: "Terms & Privacy Policy")
    profileImageButton.setBackgroundImage(#imageLiteral(resourceName: "camera-dark"), for: .normal)
    signUpButton.setImage(#imageLiteral(resourceName: "button-placeholder"), for: .normal)
    signUpButton.setBackgroundImage(#imageLiteral(resourceName: "button-placeholder"), for: .normal)
    
      //delegate
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
      //add target to sign up button
    signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    
    configureConstraints()
    
    }
  
  //:--Constraints
  
  func configureConstraints() {
    
    joinUs.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 10, right: view.trailingAnchor, paddingRight: -20, bottom: nil, left: view.leadingAnchor, paddingLeft: 20)
    joinUs.heightConstraint(height: 116)
       
    signUpLabel.anchor(top: joinUs.bottomAnchor, paddingTop: 20, right: view.trailingAnchor, paddingRight: 20, bottom: nil, left: view.leadingAnchor, paddingLeft: 20)
    signUpLabel.heightConstraint(height: 30)
       
    profileImageButton.anchor(top: signUpLabel.bottomAnchor, paddingTop: 10, right: nil, bottom: nil, left: nil)
    profileImageButton.hStack(view.centerXAnchor)
    profileImageButton.size(width: 70, height: 70)
       
    emailTextField.anchor(top: profileImageButton.bottomAnchor, paddingTop: 20, right: view.trailingAnchor, paddingRight: 20, bottom: nil, paddingBottom: 0, left: view.leadingAnchor, paddingLeft: 20)
    emailTextField.heightConstraint(height: 50)
       
    passwordTextField.anchor(top: emailTextField.bottomAnchor, paddingTop: 20, right: view.trailingAnchor, paddingRight: 20, bottom: nil, paddingBottom: 0, left: view.leadingAnchor, paddingLeft: 20)
         passwordTextField.heightConstraint(height: 50)
    
    signUpButton.anchor(top: nil, paddingTop: 0, right: nil, paddingRight: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 40, left: view.leadingAnchor, paddingLeft: 20)
    signUpButton.size(width: 80, height: 80)

    termsButton.anchor(top: nil, paddingTop: 0, right: view.trailingAnchor, paddingRight: 20, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 70, left: nil, paddingLeft: 0)
    termsButton.size(width: 200, height: 20)
    
  }
}

extension SignUpScreen: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
  }
}

extension SignUpScreen: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let editedImage = info[.editedImage] as? UIImage {
      profileImageButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
    } else if let originalImage = info[.originalImage] as? UIImage {
      profileImageButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    profileImageButton.layer.cornerRadius = profileImageButton.frame.width / 2
    profileImageButton.layer.masksToBounds = true
    profileImageButton.layer.borderWidth = 2
    profileImageButton.layer.borderColor = UIColor.systemGray4.cgColor

    dismiss(animated: true, completion: nil)
  }
}


//    NSLayoutConstraint.activate([
//
//        signUpLabel.topAnchor.constraint(equalTo: joinUs.bottomAnchor, constant: 20),
//        signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//        signUpLabel.heightAnchor.constraint(equalToConstant: 30),
//
//        profileImageButton.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 10),
//        profileImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        profileImageButton.widthAnchor.constraint(equalToConstant: 70),
//        profileImageButton.heightAnchor.constraint(equalToConstant: 70),
//
//        emailTextField.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 20),
//        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//        emailTextField.heightAnchor.constraint(equalToConstant: 50),
//
//        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
//        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//        passwordTextField.heightAnchor.constraint(equalToConstant: 50),
//
//        signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
//        signUpButton.heightAnchor.constraint(equalToConstant: 80),
//        signUpButton.widthAnchor.constraint(equalToConstant: 80),
//        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//        termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
//        termsButton.heightAnchor.constraint(equalToConstant: 20),
//        termsButton.widthAnchor.constraint(equalToConstant: 200),
//        termsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//
//      ])
