//
//  SHTextField.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 29/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHTextField: UITextField {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func configure() {
    textColor = .label
    placeholder = "Mobile Phone"
  }
}
