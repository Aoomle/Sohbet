//
//  Calls.swift
//  Sohbets
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class Profile: UIViewController {

  private var tableView: UITableView!
  private var tableViewCell: UITableViewDelegate!
  private let customNavBar = CustomNavBar(title: "   Profile", secondIcon: #imageLiteral(resourceName: "icons8-add_to_chat"))
  private let imageProfile = UIImageView(image: #imageLiteral(resourceName: "sharon-mccutcheon-7PZ8Gb-pmaA-unsplash"), contentMode: .scaleAspectFill)
  private let topView = UIView()
  
  private let descriptionText: UITextView = {
    let textView = UITextView()
    
    let titleLabel = NSMutableAttributedString(string: "Mamie Drake", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
    
    titleLabel.append(NSAttributedString(string: "\n\nAbout Me", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]))
    titleLabel.append(NSAttributedString(string: "\n\nI love travelling, dancing and watching tv series. plus I am a big believe of Gen. Buhari (PMB).", attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .body)]))
    textView.translatesAutoresizingMaskIntoConstraints  = false
    
    textView.attributedText = titleLabel
    return textView
  }()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      configureNavBar()
      configureViewController()
  }
  
  fileprivate func configureViewController() {
      view.backgroundColor = .systemBackground
      view.addSubview(descriptionText)
    descriptionText.backgroundColor = .red
      imageProfile.isUserInteractionEnabled  = true
    
      view.addSubview(topView)
      topView.addSubview(imageProfile)
      topView.translatesAutoresizingMaskIntoConstraints = false
      imageProfile.translatesAutoresizingMaskIntoConstraints = false
    

    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: view.topAnchor),
      topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),

      imageProfile.topAnchor.constraint(equalTo: topView.topAnchor),
      imageProfile.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
      imageProfile.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
      imageProfile.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
      
      descriptionText.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
      descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      descriptionText.heightAnchor.constraint(equalToConstant: 200),
      
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
      tableView = UITableView(frame: .zero, style: .plain)
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.backgroundColor = .systemBackground
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
     ])
  }
  
  @objc func handleSearch() {
    print(#function)
  
  }
}


//  fileprivate func configureCollectionView() {
//    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    view.addSubview(collectionView)
//
//    collectionView.delegate = self
//    collectionView.dataSource = self
//    collectionView.translatesAutoresizingMaskIntoConstraints = false
//    collectionView.backgroundColor = .red
//    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
//    collectionView.contentInset.top = 150
////    NSLayoutConstraint.activate([
////       collectionView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: 10),
////       collectionView.widthAnchor.constraint(equalToConstant: 40),
////       collectionView.heightAnchor.constraint(equalToConstant: 40),
////       collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
////     ])
//  }
  
