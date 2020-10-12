//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit
import Firebase
  
class Chat: UICollectionViewController {

  let customNavBar = CustomNavBar(title: "Chat", firstIcon: #imageLiteral(resourceName: "add"), secondIcon: #imageLiteral(resourceName: "icons8-search"))
  fileprivate let cellID = "cellID"
  var items = [StatusMessenger]()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      configureNavBar()
      configureCollectionController()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
     self.tabBarController?.tabBar.isHidden = false
  }
  
  fileprivate func configureCollectionController() {
    collectionView.backgroundColor = .systemBackground
    collectionView.register(ChatCell.self, forCellWithReuseIdentifier: cellID)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.contentInset.top = 110

    items = [StatusMessenger(name: "Number One", profileImageView: ""),
             StatusMessenger(name: "Number two", profileImageView: ""),
             .init(name: "Number Tree", profileImageView: ""),
             .init(name: "Number Four", profileImageView: ""),
             StatusMessenger(name: "Number One", profileImageView: ""),
             StatusMessenger(name: "Number two", profileImageView: ""),
             .init(name: "Number Tree", profileImageView: ""),
             StatusMessenger(name: "Number One", profileImageView: ""),
             StatusMessenger(name: "Number two", profileImageView: ""),
             .init(name: "Number Tree", profileImageView: "")
    ]
  }
  
  
  fileprivate func configureNavBar() {
    let statusBarCover = UIView()
    statusBarCover.backgroundColor = .systemBackground
    view.addSubview(statusBarCover)
    view.addSubview(customNavBar)
    customNavBar.getShadow()
    
    customNavBar.firstIcon.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
    customNavBar.secondIcon.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    
    statusBarCover.anchor(top: view.topAnchor, right: view.trailingAnchor, bottom: nil, left: view.leadingAnchor)
    statusBarCover.heightConstraint(height: 44)
    customNavBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.trailingAnchor, bottom: nil, left: view.leadingAnchor)
    customNavBar.heightConstraint(height: 100)
    
   }
  
  ///IBACTION
  @objc func handleSearch() {
    print(#function)
  }

  @objc func handleAdd() {
    print(#function)
  
  }
  
  ///FIRESTORE
  
  fileprivate func fetchMessages() {
//    Database.database().reference(withPath: "messages").ch
  }
}

extension Chat: UICollectionViewDelegateFlowLayout {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
    
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ChatCell
    cell.item = items[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
   }
   
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
    let layout = UICollectionViewFlowLayout()
//    layout.hide
    let chatLog = ChatLog(collectionViewLayout: layout)

//    chatLog.tabBarController?.hidesBottomBarWhenPushed = true
    show(chatLog, sender: nil)
//    navigationController?.pushViewController(chatLog, animated: true)
        tabBarController?.hidesBottomBarWhenPushed = true
  }
   
}
