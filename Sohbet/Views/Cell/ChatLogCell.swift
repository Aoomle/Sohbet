//
//  ChatLogCell.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 24/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit



class ChatLogCell: UICollectionViewCell {
  
  let textView: UITextView = {
    let tv = UITextView()
    tv.backgroundColor = .clear
    tv.font = .systemFont(ofSize: 20)
    tv.isEditable = false
    tv.isScrollEnabled = false
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.textColor = .systemBackground
    return tv
  }()
  
  let bubbleContainer = UIView()
  
  var message: Messages! {
    didSet {
      textView.text = message.text
      
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(bubbleContainer)
    bubbleContainer.addSubview(textView)
    bubbleContainer.translatesAutoresizingMaskIntoConstraints = false
    bubbleContainer.backgroundColor = .label
    bubbleContainer.layer.cornerRadius = 12
    
    bubbleContainer.anchor(top: topAnchor, right: trailingAnchor, bottom: bottomAnchor, left: nil, paddingRight: 20)
    bubbleContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
    
    textView.anchor(top: bubbleContainer.topAnchor, right: bubbleContainer.trailingAnchor, bottom: bubbleContainer.bottomAnchor, left: bubbleContainer.leadingAnchor, paddingTop: 4, paddingRight: 12, paddingBottom: 4, paddingLeft: 12)
   
  }
  
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
