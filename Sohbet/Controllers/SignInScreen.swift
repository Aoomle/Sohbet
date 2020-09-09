//
//  SignInScreen.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 30/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SignInScreen: UIViewController {
  
  let welcomeMessage = SHLabel(title: "Welcome\nBack!", textAlign: .left)
  let signInLabel = SHLabel(title: "Sign In", textAlign: .left, fontSize: UIFont.preferredFont(forTextStyle: .subheadline))
  
  let emailTextField = SHTextField(placeHolder: "Enter email address", textFieldType: .emailAddress)
  let passwordTextField = SHTextField(placeHolder: "Enter password", textFieldType: .default, typeOfTextField: true)
  
  let signInButton = SHButton()
  let forgetPasswordButton = SHButton()
  
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
  
  
  @objc fileprivate func signInAction() {
    guard isEmailEntered else {
      showError(message: "Email can't be empty, please type your email address", buttonTitle: "Ok")
      return
    }
    
    guard isPasswordEntered else {
      showError(message: "Password can't be empty", buttonTitle: "Ok")
      return
    }
    
    guard emailTextField.text!.isEmailVaid else {
      showError(message: "Email validation issue", buttonTitle: "Ok")
      return
    }
    
    //do networking here
   // startLoading()
    navigationController?.setNavigationBarHidden(true, animated: true)
    navigationController?.pushViewController(TabMenu(), animated: true)
    print("Do networking in signing in")
   }
    
  
  @objc fileprivate func forgetPasswordAction() {
     pushToAnotherScreen(title: "Sign In", viewController: ForgetPasswordScreen())
   }

  fileprivate func pushToAnotherScreen(title: String, viewController: UIViewController) {
     navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
     navigationController?.pushViewController(viewController, animated: true)
   }
  
  fileprivate func configureView() {
    
    view.addSubview(welcomeMessage)
    view.addSubview(signInLabel)
    
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    
    view.addSubview(signInButton)
    view.addSubview(forgetPasswordButton)
    
    forgetPasswordButton.setTitleColor(.label, for: .normal)
    forgetPasswordButton.setTitle("Forget password?", for: .normal)
    
    signInButton.setImage(#imageLiteral(resourceName: "button-placeholder"), for: .normal)
    signInButton.setBackgroundImage(#imageLiteral(resourceName: "button-placeholder"), for: .normal)
    
    //delegate
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
    //add target to sign up button
    signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordAction), for: .touchUpInside)
   
    NSLayoutConstraint.activate([
      
      welcomeMessage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      welcomeMessage.heightAnchor.constraint(equalToConstant: 116),
      welcomeMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      welcomeMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      signInLabel.topAnchor.constraint(equalTo: welcomeMessage.bottomAnchor, constant: 20),
      signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      signInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      signInLabel.heightAnchor.constraint(equalToConstant: 30),
      
      emailTextField.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
      emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 50),
      
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      passwordTextField.heightAnchor.constraint(equalToConstant: 50),
           
      //bottom
      
      signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
      signInButton.heightAnchor.constraint(equalToConstant: 80),
      signInButton.widthAnchor.constraint(equalToConstant: 80),
      signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      
      forgetPasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
      forgetPasswordButton.heightAnchor.constraint(equalToConstant: 20),
      forgetPasswordButton.widthAnchor.constraint(equalToConstant: 150),
      forgetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
      
    ])
    
  }
  
}

extension SignInScreen: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
  }
}
