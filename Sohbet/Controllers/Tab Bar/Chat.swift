//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {

let imageProfileView = UIImageView(image: #imageLiteral(resourceName: "sharon-mccutcheon-7PZ8Gb-pmaA-unsplash"), contentMode: .scaleAspectFill)
let usernameLabel = UILabel(text: "Username Here", font: .boldSystemFont(ofSize: 14), textColor: .label, textAlignment: .center, numberOfLines: 2)

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
  
  imageProfileView.layer.cornerRadius = 80 / 2
  NSLayoutConstraint.activate([
    imageProfileView.widthAnchor.constraint(equalToConstant: 80),
    imageProfileView.heightAnchor.constraint(equalToConstant: 80),
    imageProfileView.centerXAnchor.constraint(equalTo: centerXAnchor),
    imageProfileView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
    
    usernameLabel.topAnchor.constraint(equalTo: imageProfileView.bottomAnchor),
    usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
    usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
    usernameLabel.heightAnchor.constraint(equalToConstant: 50)
  ])
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}



  
class Chat: UICollectionViewController {

  let customNavBar = CustomNavBar(title: "Chat", firstIcon: #imageLiteral(resourceName: "add"), secondIcon: #imageLiteral(resourceName: "icons8-search"))
  var items = [StatusMessenger]()
  override func viewDidLoad() {
      super.viewDidLoad()
      configureNavBar()
      configureCollectionController()
      //configureCollectionView()
  }
  
  fileprivate func configureCollectionController() {
      view.backgroundColor = .systemBackground
      collectionView.backgroundColor = .systemBackground
      //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    collectionView.register(ChatCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "headerId")
     collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
      collectionView.contentInset.top = 110
    
    
    items = [StatusMessenger(name: "Number One", profileImageView: ""),
                 StatusMessenger(name: "Number two", profileImageView: ""),
                 .init(name: "Number Tree", profileImageView: "")
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
  
//  fileprivate func configureCollectionView() {
//    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    view.addSubview(collectionView)
//    collectionView.translatesAutoresizingMaskIntoConstraints = false
//    collectionView.anchor(top: customNavBar.bottomAnchor, paddingTop: 10, right: view.trailingAnchor, bottom: view.bottomAnchor, left: view.leadingAnchor)
//
////    NSLayoutConstraint.activate([
////       collectionView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: 10),
////       collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
////       collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
////       collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
////     ])
//  }
  
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
    header.backgroundColor = .blue
    return header
  }
//
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
     cell.backgroundColor = .purple
      return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print(indexPath.item)
    }
   
}
