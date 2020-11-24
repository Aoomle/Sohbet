//
//  Chatlog.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 22/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController {
  
  let navCustom = ChatLogNavBar()
  
  let item = [
    Messages(text: "Hello my name is kodi international...", isFromCurrentUser: false),
    
    Messages(text: "This is bad boy in the building.. and I thought i told you we wont stop.. As long as you love me, you will be your hero be your superman, in the darkest time lets us just be together and fight it through the way...", isFromCurrentUser: true),
    
    Messages(text: "This is bad boy in the building.. and I thought i told you we wont stop.. As long as you love me, you will be your hero be your superman, in the darkest time lets us just be together and fight it through the way...This is bad boy in the building.. and I thought i told you we wont stop.. As long as you love me, you will be your hero be your superman, in the darkest time lets us just be together and fight it through the way...", isFromCurrentUser: false)
  ]
  
  let navCustomHeight: CGFloat = 120
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
    view.addSubview(navCustom)
    navCustom.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.trailingAnchor, bottom: nil, left: view.leadingAnchor)
    navCustom.heightConstraint(height: navCustomHeight)
    navCustom.backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
  }
  
  
  
  override var canBecomeFirstResponder: Bool {
   return true
  }
  
  lazy var redView:  UIView = {
    return CustomInputAccessoryView(frame: .init(x: 0, y: 0, width: view.frame.width, height: 50))
  }()
  
  override var inputAccessoryView: UIView? {
    get {
     return redView
    }
  }
  
  fileprivate func setupCollectionView() {
    collectionView.keyboardDismissMode = .interactive
    collectionView.backgroundColor = .systemBackground
    collectionView.register(ChatLogCell.self, forCellWithReuseIdentifier: "cellID")
    collectionView.contentInset.top = navCustomHeight
    collectionView.verticalScrollIndicatorInsets.top = navCustomHeight
    
    let statusBarCover = UIView()
    statusBarCover.backgroundColor = .systemBackground
    view.addSubview(statusBarCover)
    statusBarCover.anchor(top: view.topAnchor, right: view.trailingAnchor, bottom: nil, left: view.leadingAnchor)
    statusBarCover.heightConstraint(height: 44)
    
    
//    let keyBoardView = UIView()
//    collectionView.addSubview(keyBoardView)
//    keyBoardView.backgroundColor = .systemPurple
//    keyBoardView.anchor(top: nil, right: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leadingAnchor)
//    keyBoardView.heightConstraint(height: 44)

  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.tabBarController?.tabBar.isHidden = true
  }
  
  @objc fileprivate func handleBack() {
    navigationController?.popViewController(animated: true)
  }
  
}

//MARK:- DataSource
extension ChatLogController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return item.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ChatLogCell
    cell.message = item[indexPath.item]
    return cell
  }
}

//MARK:- Delegate Flow Layout
extension ChatLogController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 16, left: 0, bottom: 16, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let estimatedSizeCell = ChatLogCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
    estimatedSizeCell.message = item[indexPath.item]
    
    estimatedSizeCell.layoutIfNeeded()
    
    let estimatedSize = estimatedSizeCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
    
    return .init(width: view.frame.width, height: estimatedSize.height)
  }
}
