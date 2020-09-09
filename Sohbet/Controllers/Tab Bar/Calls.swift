//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class Calls: UICollectionViewController {

  
  let customNavBar = CustomNavBar()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .systemBackground
      //collectionView = UICollectionViewFlowLayout()
      setpUI()
  }
  
  fileprivate func setpUI() {
    view.addSubview(customNavBar)
    
    NSLayoutConstraint.activate([
      customNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
      customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      customNavBar.heightAnchor.constraint(equalToConstant: 150)
    ])
    
  }
  
}
