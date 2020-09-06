//
//  SignUpScreen.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 30/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SignUpScreen: UIViewController {

  let joinUs = SHLabel(title: "Join Us!", textAlign: .left)
  let signUpLabel = SHLabel(title: "Sign Up", textAlign: .left, fontSize: UIFont.preferredFont(forTextStyle: .subheadline))
   
  let emailTextField = SHTextField(placeHolder: "Enter email address", textFieldType: .emailAddress)
  let passwordTextField = SHTextField(placeHolder: "Enter password", textFieldType: .default, typeOfTextField: true)
   
  let signUpButton = SHButton()
  let termsButton = SHButton()
  
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
  
  @objc fileprivate func signUpAction() {
      print("Do networking in signing up")
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
      
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
      
    view.addSubview(signUpButton)
    view.addSubview(termsButton)
      
    termsButton.setTitleColor(.label, for: .normal)
    termsButton.setTitle("Terms & Privacy Policy", for: .normal)
      
    signUpButton.setImage(#imageLiteral(resourceName: "button-placeholder"), for: .normal)
    signUpButton.setBackgroundImage(#imageLiteral(resourceName: "button-placeholder"), for: .normal)
    
      //delegate
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
      //add target to sign up button
    signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    termsButton.addTarget(self, action: #selector(termsButtonAction), for: .touchUpInside)
      
    NSLayoutConstraint.activate([
        
        joinUs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        joinUs.heightAnchor.constraint(equalToConstant: 116),
        joinUs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        joinUs.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        signUpLabel.topAnchor.constraint(equalTo: joinUs.bottomAnchor, constant: 20),
        signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        signUpLabel.heightAnchor.constraint(equalToConstant: 30),
             
        emailTextField.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 20),
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        emailTextField.heightAnchor.constraint(equalToConstant: 50),
             
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        
        signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        signUpButton.heightAnchor.constraint(equalToConstant: 80),
        signUpButton.widthAnchor.constraint(equalToConstant: 80),
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
        termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
        termsButton.heightAnchor.constraint(equalToConstant: 20),
        termsButton.widthAnchor.constraint(equalToConstant: 200),
        termsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
      ])
    }
}

extension SignUpScreen: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
  }
}
