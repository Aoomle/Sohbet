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
  
  init(placeHolder: String, textFieldType: UIKeyboardType, typeOfTextField: Bool = false) {
    super.init(frame: .zero)
    self.placeholder = placeHolder
    self.keyboardType = textFieldType
    self.isSecureTextEntry = typeOfTextField
    configure()
  }
  
  fileprivate func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.cornerRadius = 10
    layer.borderWidth = 1
    layer.borderColor = UIColor.systemGray4.cgColor
    
    textColor = .label
    tintColor = .label
    textAlignment = .center
    font = UIFont.preferredFont(forTextStyle: .title3)
    adjustsFontSizeToFitWidth  = true
    minimumFontSize = 12
    
    backgroundColor = .tertiarySystemFill
    autocorrectionType = .no
  
  }
}
