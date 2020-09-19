//
//  ProfileCell.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 13/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
  
  private var tableView = UITableView()
  private let customNavBar = CustomNavBar(title: "   Profile", secondIcon: #imageLiteral(resourceName: "icons8-add_to_chat"))
  private let imageProfile = UIImageView(image: #imageLiteral(resourceName: "sharon-mccutcheon-7PZ8Gb-pmaA-unsplash"), contentMode: .scaleAspectFill)
  private let topView = UIView()
  private let settingsUser = ["Mobile No", "Account", "Notifications", "Help", "Tell a friend"]
  
  private let descriptionText: UITextView = {
    let textView = UITextView()
    
    let titleLabel = NSMutableAttributedString(string: "Mamie Drake", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor.label])
    
    titleLabel.append(NSAttributedString(string: "\n\nAbout Me", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.label]))
    titleLabel.append(NSAttributedString(string: "\n\nI love travelling, dancing and watching tv series. plus I am a big believe of Gen. Buhari (PMB).", attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .body), NSAttributedString.Key.foregroundColor : UIColor.label]))
    textView.translatesAutoresizingMaskIntoConstraints  = false
    textView.isEditable = false
    textView.isScrollEnabled = false
    textView.attributedText = titleLabel
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureNavBar()
    self.configureViewController()
    self.configureCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  fileprivate func configureViewController() {
      backgroundColor = .systemBackground
      addSubview(descriptionText)

      imageProfile.isUserInteractionEnabled  = true
    
      addSubview(topView)
      topView.addSubview(imageProfile)
      topView.translatesAutoresizingMaskIntoConstraints = false
      imageProfile.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
      topView.leadingAnchor.constraint(equalTo: leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: trailingAnchor),
      topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),

      imageProfile.topAnchor.constraint(equalTo: topView.topAnchor),
      imageProfile.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
      imageProfile.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
      imageProfile.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
      
      descriptionText.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
      descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      descriptionText.heightAnchor.constraint(equalToConstant: 200)
      
    ])
  }
  
  fileprivate func configureNavBar() {
      imageProfile.addSubview(customNavBar)
      customNavBar.backgroundColor = .clear
      customNavBar.secondIcon.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
  
    NSLayoutConstraint.activate([
      customNavBar.topAnchor.constraint(equalTo: imageProfile.safeAreaLayoutGuide.topAnchor),
      customNavBar.leadingAnchor.constraint(equalTo: imageProfile.leadingAnchor),
      customNavBar.trailingAnchor.constraint(equalTo: imageProfile.trailingAnchor),
      customNavBar.heightAnchor.constraint(equalToConstant: 100),
    ])
    
  }
  
  fileprivate func configureCollectionView() {
      tableView.delegate = self
      tableView.dataSource = self
      addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.backgroundColor = .systemBackground
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
     ])
  }
  
  
  @objc func handleSearch() {
    print(#function)
  
  }
  
}

extension ProfileCell: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settingsUser.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    cell.textLabel?.text = settingsUser[indexPath.row]
    return cell
  }

}

