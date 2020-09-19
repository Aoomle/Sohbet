//
//  SHButton.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 29/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class SHButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(backgroundColor: UIColor, title: String, radius: Int = 0) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    self.layer.cornerRadius = CGFloat(radius)
    configure()
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    titleLabel?.textColor = .label
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
  }

}

extension UIButton {
  func customButton(background: UIColor, titleColor: UIColor, title: String, radius: Int = 0){
    self.backgroundColor = background
    self.setTitleColor(titleColor, for: .normal)
    self.setTitle(title, for: .normal)
    self.layer.cornerRadius = CGFloat(radius)
  }
  
}
