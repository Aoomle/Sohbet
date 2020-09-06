//
//  SHAlertBody.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 05/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHAlertBody: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(textAlign: NSTextAlignment = .center) {
    super.init(frame: .zero)
    self.textAlignment = textAlign
    configure()
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .secondaryLabel
    adjustsFontSizeToFitWidth = true
    lineBreakMode = .byWordWrapping
    minimumScaleFactor = 0.75
    font = UIFont.preferredFont(forTextStyle: .body)
    numberOfLines = 4
  }
}
