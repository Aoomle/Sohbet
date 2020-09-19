//
//  ChatCell.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 19/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {

let imageProfileView = UIImageView(image: #imageLiteral(resourceName: "sharon-mccutcheon-7PZ8Gb-pmaA-unsplash"), contentMode: .scaleAspectFill)
let usernameLabel = UILabel(text: "Username Here", font: .boldSystemFont(ofSize: 16), textColor: .label, textAlignment: .center, numberOfLines: 2)
let messageLabel = UILabel(text: "Hello everyone", font: .boldSystemFont(ofSize: 16), textColor: .label, textAlignment: .center, numberOfLines: 2)

var item: StatusMessenger! {
  didSet{
    usernameLabel.text = item.name
  }
}

override init(frame: CGRect) {
  super.init(frame: frame)
  imageProfileView.translatesAutoresizingMaskIntoConstraints = false
  usernameLabel.translatesAutoresizingMaskIntoConstraints = false
  addSubview(imageProfileView)
  addSubview(usernameLabel)
  addSubview(messageLabel)
  
  imageProfileView.anchor(top: topAnchor, paddingTop: 20, right: nil, paddingRight: 0, bottom: nil, paddingBottom: 0, left: leadingAnchor, paddingLeft: 20)
  imageProfileView.size(width: 60, height: 60)
  imageProfileView.layer.cornerRadius = 30
  imageProfileView.clipsToBounds = true
  
  let stackView = UIStackView(arrangedSubviews: [usernameLabel, messageLabel])
  addSubview(stackView)
  stackView.distribution = .fill
  stackView.alignment = .leading
  stackView.axis = .vertical
  stackView.spacing = 5
  stackView.translatesAutoresizingMaskIntoConstraints = false
  stackView.anchor(top: topAnchor, paddingTop: 20, right: trailingAnchor, paddingRight: 20, bottom: bottomAnchor, paddingBottom: 30, left: imageProfileView.trailingAnchor, paddingLeft: 20)
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
