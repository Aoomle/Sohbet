//
//  ForgetPasswordScreen.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 31/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class ForgetPasswordScreen: UIViewController {
  
  let forgetPasswordLabel = SHLabel(title: "Forget Password", textAlign: .center, fontSize: UIFont.systemFont(ofSize: 30))
  let enterPasswordMessageLabel = SHLabel(title: "Enter the email address associated with your account", textAlign: .center)
   
  let emailTextField = SHTextField(placeHolder: "Enter email address", textFieldType: .emailAddress)
  
  let resetButton = SHButton(target: self, action: #selector(resetAction), tams: false)
   
  var isEmailEntered: Bool {
     return !emailTextField.text!.isEmpty
   }
   
  
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
  
  let resetHUD = JGProgressHUD(style: .dark)
  
  @objc fileprivate func resetAction() {
    guard isEmailEntered, let email = emailTextField.text else {
        showError(message: "Email can't be empty, please enter your email address", buttonTitle: "Ok")
        return
      }
    guard emailTextField.text!.isEmailVaid else {
        showError(message: "Email validation failed please enter your email address correct", buttonTitle: "Ok")
        return
      }

    resetHUD.textLabel.text = "Resetting Password..."
    resetHUD.show(in: view)
    
    Auth.auth().sendPasswordReset(withEmail: email) { (err) in
      if let err = err {
        self.resetErrorHUD(err: err)
        return
      }
      self.showError(message: "We've have sent you a link to your email address oh how to reset your password", buttonTitle: "Ok")
      self.resetHUD.dismiss(animated: true)
      self.navigationController?.popToRootViewController(animated: true)
    }

    view.endEditing(true)
   }
  
  fileprivate func resetErrorHUD(err: Error) {
    resetHUD.dismiss()
    let resetPassword = JGProgressHUD(style: .dark)
    resetPassword.dismiss(animated: true)
    resetPassword.textLabel.text = err.localizedDescription
    resetPassword.show(in: self.view)
    resetPassword.dismiss(afterDelay: 4, animated: true)
  }
  
  fileprivate func configureView() {
    view.addSubview(forgetPasswordLabel)
    view.addSubview(enterPasswordMessageLabel)
    view.addSubview(emailTextField)
    view.addSubview(resetButton)
    
    emailTextField.delegate = self
    
    enterPasswordMessageLabel.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
    
    resetButton.customButton(background: .label, titleColor: .systemBackground, title: "Rest Password")
    resetButton.layer.cornerRadius = 20
   
    configureConstraints()
    
  }
  
  fileprivate func configureConstraints() {
    //Layout change width of forget password label is too large
    //adjust the font size instead of using width constrait as 250
    forgetPasswordLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,  right: nil,  bottom: nil, left: nil, paddingTop: 50)
    forgetPasswordLabel.hStack(view.centerXAnchor)
    forgetPasswordLabel.size(width: 250, height: 50)
    
    enterPasswordMessageLabel.anchor(top: forgetPasswordLabel.bottomAnchor, right: view.trailingAnchor,  bottom: nil, left: view.leadingAnchor, paddingTop: 20, paddingRight: 20, paddingLeft: 20)
    enterPasswordMessageLabel.heightConstraint(height: 50)
    
    emailTextField.anchor(top: enterPasswordMessageLabel.bottomAnchor,right: view.trailingAnchor,  bottom: nil, left: view.leadingAnchor,  paddingTop: 40, paddingRight: 20, paddingBottom: 0,  paddingLeft: 20)
    emailTextField.heightConstraint(height: 50)
    
    resetButton.anchor(top: emailTextField.bottomAnchor,right: view.trailingAnchor, bottom: nil, left: view.leadingAnchor, paddingTop: 40, paddingRight: 20, paddingLeft: 20)
    resetButton.heightConstraint(height: 50)
  }
  
  
}

extension ForgetPasswordScreen: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
  }
}
