//
//  ViewController.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 29/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit
import FirebaseAuth

class Home: UIViewController {

  let logo = SHLabel(title: "Sohbet")
  let signInButton = SHButton(backgroundColor: .white, title: "Sign In")
  let signUpButton = SHButton(backgroundColor: .darkText, title: "Sign Up")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.setNavigationBarHidden(true, animated: true)
    configureViews()
    actionButtons()
  }

  override func viewWillAppear(_ animated: Bool) {
    if NetworkingManager.shared.userIsLoggedIn() {
      self.navigationController?.setNavigationBarHidden(true, animated: true)
      self.navigationController?.pushViewController(TabMenu(), animated: true)
    }
  }
  
  fileprivate func configureViews() {
    signInButton.setTitleColor(.darkText, for: .normal)
    
    view.addSubview(logo)
    view.addSubview(signInButton)
    view.addSubview(signUpButton)
    
    NSLayoutConstraint.activate([
      logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
      logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logo.widthAnchor.constraint(equalToConstant: 160),
      logo.heightAnchor.constraint(equalToConstant: 60),
      
      signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor),
      signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      signInButton.heightAnchor.constraint(equalToConstant: 60),
      
      signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      signUpButton.heightAnchor.constraint(equalToConstant: 60)
      
    ])
  }
 
  fileprivate func actionButtons() {
    signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
  }
  
  @objc fileprivate func signInAction() {
    pushToAnotherScreen(title: "Sign Up", viewController: SignInScreen())
  }
  
  @objc fileprivate func signUpAction() {
    pushToAnotherScreen(title: "Sign In", viewController: SignUpScreen())
  }

  fileprivate func pushToAnotherScreen(title: String, viewController: UIViewController) {
    navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    navigationController?.pushViewController(viewController, animated: true)
  }
}

