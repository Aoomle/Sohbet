//
//  SHButton.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 29/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHButton: UITextField {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
  }
}
