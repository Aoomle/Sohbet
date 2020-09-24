//
//  ChatLogNav.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 22/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ChatLogNavBar: UIView {
  
  let circleImage = UIImageView(image: #imageLiteral(resourceName: "aoomle"), contentMode: .scaleAspectFill)
  let moreButton = UIButton(image: #imageLiteral(resourceName: "more-dark"), tintColor: .label)
  let backButton = UIButton(image: #imageLiteral(resourceName: "back-dark"), tintColor: .label)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
   
    setupShadow(color: UIColor(white: 0, alpha: 0.5).cgColor, radius: 8, Offset: CGSize(width: 0, height: 10), opacity: 0.2)
    backgroundColor = .white
    
    getciruclarImageView(image: circleImage, widht: 44)
    
    let usernameLabel = UILabel(text: "Abdulmalik Muhammad", font: .boldSystemFont(ofSize: 13), textColor: .label, textAlignment: .center, numberOfLines: 3)
    
    let verticalStack = UIStackView(arrangedSubviews: [circleImage, usernameLabel])
    verticalStack.axis = .vertical
    verticalStack.alignment = .center
    verticalStack.spacing = 8
    
    backButton.widthConstraint(width: 50)
    let horizontalStackView = UIStackView(arrangedSubviews: [backButton, verticalStack, moreButton])
    horizontalStackView.alignment = .center
    
    addSubview(horizontalStackView)
    
    horizontalStackView.anchor(top: safeAreaLayoutGuide.topAnchor, right: safeAreaLayoutGuide.trailingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, left: safeAreaLayoutGuide.leadingAnchor, paddingTop: 0 ,paddingRight: 16, paddingLeft: 0)
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  fileprivate func getciruclarImageView(image: UIImageView, widht: CGFloat){
    image.size(width: widht, height: widht)
    image.layer.cornerRadius = widht / 2
    image.clipsToBounds = true
  }
  
}
