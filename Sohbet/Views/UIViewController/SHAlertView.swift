//
//  SHAlertView.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 01/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHAlertView: UIViewController {
  
  let containerView = SHContainerView()
  
  let titleLabel = SHAlertTitle(textAlign: .center, fontSize: 20)
  let messageLabel = SHAlertBody(textAlign: .center)
  
  let actionButton = SHButton(backgroundColor: .darkText, title: "Ok")
  
  var alertTitle: String?
  var message: String?
  var buttonTitle: String?
  
  init(title: String, message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.message = message
    self.buttonTitle = buttonTitle
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    configureView()
  }
  
  fileprivate func configureView() {
    view.addSubview(containerView)
    containerView.addSubview(titleLabel)
    containerView.addSubview(actionButton)
    containerView.addSubview(messageLabel)
    
    //action
    actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    
    //
    titleLabel.text = alertTitle ?? "Problem with the connection"
    actionButton.setTitle(buttonTitle ?? "Done", for: .normal)
    messageLabel.text = message ?? "Unable to complete request"

    
    NSLayoutConstraint.activate([
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 280),
      containerView.heightAnchor.constraint(equalToConstant: 200),
      
      //Title
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      titleLabel.heightAnchor.constraint(equalToConstant: 28),
      
      //Button
      actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
      actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      actionButton.heightAnchor.constraint(equalToConstant: 44),
      
      //body
      messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
      
    ])
  }
  
  @objc fileprivate func dismissVC() {
    dismiss(animated: true, completion: nil)
  }
  
}
