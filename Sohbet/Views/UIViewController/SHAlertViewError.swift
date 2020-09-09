//
//  SHAlertView.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 01/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHAlertViewError: UIViewController {
  
  let containerView = SHContainerView()
  
  let messageLabel = SHAlertBody(textAlign: .center)
  
  let actionButton = SHButton(backgroundColor: .darkText, title: "Ok")
  
  var message: String?
  var buttonTitle: String?
  
  init(message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
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
    containerView.addSubview(messageLabel)
    containerView.addSubview(actionButton)
    
    //action
    actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    
    //adding configuration
    actionButton.layer.cornerRadius = 10
    actionButton.layer.masksToBounds = true
    messageLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    messageLabel.textColor = .label
    actionButton.setTitle(buttonTitle ?? "Done", for: .normal)
    messageLabel.text = message ?? "Unable to complete request"
    
    NSLayoutConstraint.activate([
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 240),
      containerView.heightAnchor.constraint(equalToConstant: 160),
      
      //body
      messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      messageLabel.heightAnchor.constraint(equalToConstant: 44),
     
      //Button
      actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
      actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      actionButton.heightAnchor.constraint(equalToConstant: 44),
      
    ])
  }
  
  
  @objc fileprivate func dismissVC() {
    dismiss(animated: true, completion: nil)
  }
  
}
