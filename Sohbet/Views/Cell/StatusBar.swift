//
//  StatusBar.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 19/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class StatusBar: UICollectionReusableView {
  
  let newStatus = UILabel(text: "New Status", font: .boldSystemFont(ofSize: 16), textColor: .label, textAlignment: .left)
  
  let horizonalView = UIView()
  
  let newMessage = UILabel(text: "New Message", font: .boldSystemFont(ofSize: 16), textColor: .label, textAlignment: .left)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    horizonalView.backgroundColor = .red
    let stackView = UIStackView(arrangedSubviews: [newStatus, horizonalView, newMessage])
    stackView.distribution = .fill
    stackView.axis = .vertical
    stackView.spacing = 10
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.anchor(top: topAnchor, paddingTop: 10, right: trailingAnchor, bottom: bottomAnchor, paddingBottom: 10, left: leadingAnchor, paddingLeft: 10)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }

}
