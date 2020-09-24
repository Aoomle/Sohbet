//
//  ChatCell.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 19/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit
import SDWebImage

class ChatCell: UICollectionViewCell {

let imageProfileView = UIImageView(image: #imageLiteral(resourceName: "sharon-mccutcheon-7PZ8Gb-pmaA-unsplash"), contentMode: .scaleAspectFill)
let usernameLabel = UILabel(text: "Username Here", font: .boldSystemFont(ofSize: 16), textColor: .label, textAlignment: .center, numberOfLines: 2)
let messageLabel = UILabel(text: "Hello everyone sdfsijnfgdsg isadjfnsfdjnasd sadfijmasdfg asdgjisd", font: .boldSystemFont(ofSize: 16), textColor: .label, textAlignment: .center, numberOfLines: 1)

var item: StatusMessenger! {
  didSet{
    usernameLabel.text = item.name
    imageProfileView.sd_setImage(with: URL(string: item.profileImageView))
  }
}

override init(frame: CGRect) {
  super.init(frame: frame)
  imageProfileView.translatesAutoresizingMaskIntoConstraints = false
  usernameLabel.translatesAutoresizingMaskIntoConstraints = false
  addSubview(imageProfileView)
  addSubview(usernameLabel)
  addSubview(messageLabel)
  
  imageProfileView.anchor(top: topAnchor, right: nil, bottom: nil, left: leadingAnchor, paddingTop: 20, paddingLeft: 20)
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
  stackView.anchor(top: topAnchor,right: trailingAnchor, bottom: bottomAnchor, left: imageProfileView.trailingAnchor, paddingTop: 20, paddingRight: 20, paddingBottom: 30, paddingLeft: 20)
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
