//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

  
class Chat: UICollectionViewController {

  let customNavBar = CustomNavBar(title: "Chat", firstIcon: #imageLiteral(resourceName: "add"), secondIcon: #imageLiteral(resourceName: "icons8-search"))
  let addStatusButton = UIButton(target: self, action: #selector(handleAdd), tams: false)
  
  var items = [StatusMessenger]()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      configureNavBar()
      configureCollectionController()
  }
  
  fileprivate func configureCollectionController() {
    collectionView.backgroundColor = .systemBackground
    collectionView.register(StatusBar.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: "headerId")
    collectionView.register(ChatCell.self, forCellWithReuseIdentifier: "cellID")
    collectionView.contentInset.top = 100
    view.addSubview(addStatusButton)
//    addStatusButton.anchor(top: customNavBar.bottomAnchor,paddingTop: 120, right: nil, bottom: nil, left: view.leadingAnchor, paddingLeft: 20)
//    addStatusButton.size(width: 40, height: 40)
//    addStatusButton.setBackgroundImage(#imageLiteral(resourceName: "camera-dark"), for: .normal)
//    addStatusButton.tintColor = .label
   // addStatusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    addStatusButton.vStack(customNavBar.centerYAnchor)
    
    items = [StatusMessenger(name: "Number One", profileImageView: ""),
             StatusMessenger(name: "Number two", profileImageView: ""),
             .init(name: "Number Tree", profileImageView: ""),
             .init(name: "Number Four", profileImageView: "")
    ]
  }
  
  
  fileprivate func configureNavBar() {
     view.addSubview(customNavBar)
     customNavBar.getShadow()
     customNavBar.firstIcon.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
     customNavBar.secondIcon.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
     
     NSLayoutConstraint.activate([
       customNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
       customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
       customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
       customNavBar.heightAnchor.constraint(equalToConstant: 100),
     ])
     
   }
  
  
  
  ///IBACTION
  @objc func handleSearch() {
    print(#function)
  }

  @objc func handleAdd() {
    print(#function)
  
  }
  
}

extension Chat: UICollectionViewDelegateFlowLayout {
  
 
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
    //header.backgroundColor = .systemPurple
    return header
  }
//
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
  
    return CGSize(width: view.frame.width, height: 200)
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
    
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
     cell.backgroundColor = .purple
      return cell
    }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
   }
   
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print(indexPath.item)
    }
   
}
