//
//  ForgetPasswordScreen.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 31/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ForgetPasswordScreen: UIViewController {
  
  let forgetPasswordLabel = SHLabel(title: "Forget Password", textAlign: .center, fontSize: UIFont.systemFont(ofSize: 30))
  let enterPasswordMessageLabel = SHLabel(title: "Enter the email address associated with your account", textAlign: .center)
   
  let emailTextField = SHTextField(placeHolder: "Enter email address", textFieldType: .emailAddress)
  
  let resetButton = SHButton(backgroundColor: .darkText, title: "Reset password", radius: 20)
   
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureView()
    dismissKeyboardWithTap()
  }
  
  fileprivate func dismissKeyboardWithTap() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
    view.addGestureRecognizer(tap)
  }
  
  @objc fileprivate func resetAction() {
      print("Try resetting password...")
    view.endEditing(true)
   }
  
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    
    if traitCollection.userInterfaceStyle == .dark {
      resetButton.backgroundColor = .white
      resetButton.setTitleColor(.black, for: .normal)
    } else if traitCollection.userInterfaceStyle == .light {
      resetButton.backgroundColor = .darkText
      resetButton.setTitleColor(.white, for: .normal)
    }
  }
  
  fileprivate func configureView() {
    
    view.addSubview(forgetPasswordLabel)
    view.addSubview(enterPasswordMessageLabel)
    view.addSubview(emailTextField)
    view.addSubview(resetButton)
    
    enterPasswordMessageLabel.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
    
    //add action to reset button
    resetButton.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
    
    //delegate
    emailTextField.delegate = self
    
    //Layout change widht of forget password label is too large
    //adjust the font size instead of using widht constrait as 250
    NSLayoutConstraint.activate([
      forgetPasswordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
      forgetPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      forgetPasswordLabel.widthAnchor.constraint(equalToConstant: 250),
      forgetPasswordLabel.heightAnchor.constraint(equalToConstant: 50),
    
      enterPasswordMessageLabel.topAnchor.constraint(equalTo: forgetPasswordLabel.bottomAnchor, constant: 20),
      enterPasswordMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      enterPasswordMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      enterPasswordMessageLabel.heightAnchor.constraint(equalToConstant: 50),
      
      emailTextField.topAnchor.constraint(equalTo: enterPasswordMessageLabel.bottomAnchor, constant: 40),
      emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      emailTextField.heightAnchor.constraint(equalToConstant: 50),
      
      resetButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
      resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      resetButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  
}

extension ForgetPasswordScreen: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
  }
}
