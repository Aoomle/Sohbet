//
//  SHLabel.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 29/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(title: String = "", textAlign: NSTextAlignment = .center, fontSize: UIFont = UIFont.preferredFont(forTextStyle: .largeTitle)) {
    super.init(frame: .zero)
    self.text = title
    self.textAlignment = textAlign
    self.font = fontSize
    configure()
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .label
    numberOfLines = 3
  }
}
