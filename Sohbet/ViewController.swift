//
//  ViewController.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 29/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var phoneNumber = SHTextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Sohbet Refactoring")
    view.backgroundColor = .systemBackground
    setupView()
  }

  fileprivate func setupView() {
    view.addSubview(phoneNumber)
    phoneNumber.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      phoneNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      phoneNumber.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      phoneNumber.widthAnchor.constraint(equalToConstant: 200),
      phoneNumber.heightAnchor.constraint(equalToConstant: 48)
    ])
    
  }

}

