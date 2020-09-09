//
//  SHAlertViewBodyLabel.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 01/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHContainerView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  init(backgroundColor: UIColor) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 16
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    backgroundColor = .systemBackground
  }
  
}
