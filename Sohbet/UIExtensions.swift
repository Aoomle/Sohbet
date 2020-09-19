//
//  UIExtensions.swift
//  ProjectOne
//
//  Created by Abdulmalik Muhammad on 11/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

extension UILabel {
  convenience public init(text: String? = nil,
                          font: UIFont = UIFont.boldSystemFont(ofSize: 16),
                          textColor: UIColor = .label,
                          textAlignment: NSTextAlignment = .left,
                          numberOfLines: Int = 2,
                          tams: Bool = true) {
    self.init()
    self.text = text
    self.font = font
    self.textColor = textColor
    self.textAlignment = textAlignment
    self.numberOfLines = numberOfLines
    self.translatesAutoresizingMaskIntoConstraints = tams
  }
}


extension UITextField {
  public convenience init(placeholder: String, textColor: UIColor = .label, secureEntry: Bool = false, tams: Bool = true) {
    self.init()
    self.placeholder = placeholder
    self.textColor = textColor
    self.isSecureTextEntry = secureEntry
    self.translatesAutoresizingMaskIntoConstraints = tams
  }
}


extension UIButton {
  convenience public init(title: String,
                          font: UIFont = UIFont.boldSystemFont(ofSize: 14),
                          titleColor: UIColor = .label,
                          titleBackgroundColor: UIColor = .clear,
                          shadow: UIColor = .clear,
                          target: Any? = nil, action: Selector? = nil,
                          tams: Bool = true){
    self.init(type: .system)
    setTitle(title, for: .normal)
    self.titleLabel?.font = font
    setTitleColor(titleColor, for: .normal)
    self.backgroundColor = titleBackgroundColor
    setTitleShadowColor(shadow, for: .normal)
    
    if let action = action {
      addTarget(target, action: action, for: .primaryActionTriggered)
    }
    self.translatesAutoresizingMaskIntoConstraints = tams
  }
  
  
  convenience public init(image: UIImage? = nil,
                          tintColor: UIColor? = nil,
                          target: Any? = nil,
                          action: Selector? = nil,
                          tams: Bool = true) {
    self.init(type: .system)
    
    if tintColor == nil {
      setImage(image, for: .normal)
    } else {
      setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
      self.tintColor = tintColor
    }
    
    if let action = action {
      addTarget(target, action: action, for: .primaryActionTriggered)
    }
    
    self.translatesAutoresizingMaskIntoConstraints = tams
  }
  
  
  convenience public init(target: Any? = nil, action: Selector? = nil, tams: Bool = true) {
    self.init(type: .system)
    if let action = action {
         addTarget(target, action: action, for: .primaryActionTriggered)
       }
     self.translatesAutoresizingMaskIntoConstraints = tams
  }
}


extension UIView {
  public func setupShadow(color: CGColor,
                          radius: CGFloat = 0,
                          Offset: CGSize,
                          opacity: Float) {
    layer.shadowColor = color
    layer.cornerRadius = radius
    layer.shadowOffset = Offset
    layer.opacity = opacity
  }
  
  func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat = 0, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat = 0, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat = 0, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat = 0) {
  translatesAutoresizingMaskIntoConstraints = false
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let right = right {
         trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
       }
    
    if let bottom = bottom {
         bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
       }
    
    if let left = left {
         leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
       }
  }
  
  func widthConstraint(width: CGFloat) {
    self.widthAnchor.constraint(equalToConstant: width).isActive = true
  }
  
  func heightConstraint(height: CGFloat) {
    self.heightAnchor.constraint(equalToConstant: height).isActive = true
  }
  
  func hStack(_ center: NSLayoutXAxisAnchor) {
    self.centerXAnchor.constraint(equalTo: center).isActive = true
  }
  
  func vStack(_ center: NSLayoutYAxisAnchor) {
    self.centerYAnchor.constraint(equalTo: center).isActive = true
  }
  
  func size(width: CGFloat, height: CGFloat) {
    self.widthAnchor.constraint(equalToConstant: width).isActive = true
    self.heightAnchor.constraint(equalToConstant: height).isActive = true
  }
  
}


extension String {

var isEmailVaid: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
  }
}


extension UIColor {
  static public func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}


extension UIImageView {
  convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFit) {
    self.init(image: image)
    self.contentMode = contentMode
    self.clipsToBounds = true
  }
}


let txt = UITextField(placeholder: "adsad", textColor: .red, secureEntry: true, tams: true)

//
//extension CustomNavBar {
//   func leftAndRightAnchor(leading: NSLayoutXAxisAnchor, trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
//    leading.constraint(equalTo: leading, constant: constant).isActive = true
//    trailing.constraint(equalTo: trailing, constant: -constant).isActive = true
//  }
//}
