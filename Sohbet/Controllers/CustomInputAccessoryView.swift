//
//  CustomInputAccessoryView.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 24/11/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class CustomInputAccessoryView: UIView {
    
    let textView = UITextView()
    let placeHolder = UILabel(text: "Chat", font: .systemFont(ofSize: 16) ,textColor: .lightGray)
    let sendButton = UIButton(title: "SEND", font: .boldSystemFont(ofSize: 14), titleColor: .black, titleBackgroundColor: .systemBackground, shadow: .systemBackground, target:nil, action: nil, tams: false)
    
    override var intrinsicContentSize: CGSize {
      return .zero
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .systemBackground

      autoresizingMask = .flexibleHeight
      
      textView.isScrollEnabled = false
     // textView.font = .systemFont(ofSize: 16)
      
      NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: UITextView.textDidChangeNotification, object: nil)
      
      let stackView = UIStackView(arrangedSubviews: [textView, sendButton])

      addSubview(stackView)
      addSubview(placeHolder)
      
      placeHolder.anchor(top: nil, right: sendButton.leadingAnchor, bottom: nil, left: leadingAnchor, paddingLeft: 20)
      placeHolder.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor).isActive = true
      sendButton.translatesAutoresizingMaskIntoConstraints = false
      sendButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
      sendButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
      
      
      stackView.translatesAutoresizingMaskIntoConstraints = false
      stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
      stackView.alignment = .center
      stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
      stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
      stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 16)
      stackView.isLayoutMarginsRelativeArrangement = true
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func handleTextChange() {
      placeHolder.isHidden = textView.text.count != 0
    }
    
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
  
}
