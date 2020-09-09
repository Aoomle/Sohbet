//
//  SHAlertTitle.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 05/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHAlertTitle: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(textAlign: NSTextAlignment = .center, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlign
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.90
    lineBreakMode = .byTruncatingTail
  }
}
