//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class CallCell: UICollectionViewCell {
  
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
    fatalError()
  }
  
}

class Calls: UICollectionViewController {

  let customNavBar = CustomNavBar(title: "Calls", secondIcon: #imageLiteral(resourceName: "add"))
 
  var items = [StatusMessenger]()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      configureNavBar()
      configureCollectionView()
      items = [StatusMessenger(name: "Number One", profileImageView: ""),
               StatusMessenger(name: "Number two", profileImageView: ""),
               .init(name: "Number Tree", profileImageView: "")
    ]
   
  }
  
  fileprivate func configureCollectionView() {
    collectionView.register(CallCell.self, forCellWithReuseIdentifier: "cellID")
    collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
    collectionView.backgroundColor = .systemBackground
    collectionView.contentInset.top = 100
    collectionView.reloadData()
//    collectionView.scrolldire
  }
  
  fileprivate func configureNavBar() {
    view.addSubview(customNavBar)
    customNavBar.getShadow()
    customNavBar.secondIcon.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
    
    customNavBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.trailingAnchor, bottom: nil, left: view.leadingAnchor)
    customNavBar.heightConstraint(height: 100)
    
  }
  

  @objc func handleAdd() {
    print(#function)
  
  }
}

///:- Data Source
extension Calls {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CallCell
    cell.item = items[indexPath.row]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
  }
  
  
}

///:  Flow Layout
extension Calls: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 120, height: 140)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
