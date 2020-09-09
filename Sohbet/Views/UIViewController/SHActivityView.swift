//
//  SHAlertView.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 01/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHActivityView: UIViewController {
  
  fileprivate let containerView = SHContainerView()
  
  fileprivate let messageLabel = SHAlertBody(textAlign: .center)
  
  let activityLoader = SHActivityIndicator()
  
  fileprivate var message: String?
  
  fileprivate var activityVoid: SHActivityIndicator?
  
  init() {
    super.init(nibName: nil, bundle: nil)
    self.activityVoid = activityLoader
    messageLabel.textColor = .black
  }
  
  init(message: String) {
    super.init(nibName: nil, bundle: nil)
    self.message = message
    self.activityVoid = activityLoader
//    messageLabel.textColor = .darkText
   // self.containerView.backgroundColor = containerBackground
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
    containerView.addSubview(activityLoader)
    containerView.addSubview(messageLabel)
  
    messageLabel.text = message ?? "Unable to complete request"
    
    NSLayoutConstraint.activate([
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 240),
      containerView.heightAnchor.constraint(equalToConstant: 120),
      
      activityLoader.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
      activityLoader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      activityLoader.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      activityLoader.heightAnchor.constraint(equalToConstant: 44),
      
      //body
      messageLabel.topAnchor.constraint(equalTo: activityLoader.bottomAnchor, constant: 20),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
      
    ])
  }

}
