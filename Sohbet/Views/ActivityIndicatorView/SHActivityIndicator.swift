//
//  SHActivityIndicators.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHActivityIndicator: UIActivityIndicatorView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  init(spinnerColor: UIColor = .label, style: UIActivityIndicatorView.Style = .large) {
    super.init(frame: .zero)
    color = spinnerColor
    self.style = style
    constraintsSpinner()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func configure() {
    style = .large
    color = .label
    constraintsSpinner()
  }
  
  fileprivate func constraintsSpinner() {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
