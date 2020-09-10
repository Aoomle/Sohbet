//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class Calls: UIViewController {

  var collectionView: UICollectionView!
  let customNavBar = CustomNavBar()
  let titled = SHLabel(title: "Calls", textAlign: .center, fontSize: UIFont.preferredFont(forTextStyle: .largeTitle))
  
  var addButton = SHButton()
  var callButton = SHButton()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      configureNavBar()
      configureViewController()
      configureCollectionView()
  }
  
  fileprivate func configureViewController() {
      view.backgroundColor = .systemBackground
  }
  
  fileprivate func configureNavBar() {
    view.addSubview(customNavBar)
    customNavBar.addSubview(addButton)
    customNavBar.addSubview(titled)

    addButton.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
    callButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    
    addButton.setBackgroundImage(#imageLiteral(resourceName: "add"), for: .normal)
    callButton.setBackgroundImage(#imageLiteral(resourceName: "call"), for: .normal)
  
    NSLayoutConstraint.activate([
      titled.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor, constant: 20),
      titled.leadingAnchor.constraint(equalTo: customNavBar.leadingAnchor),
      titled.widthAnchor.constraint(equalToConstant: 100),
      titled.heightAnchor.constraint(equalToConstant: 100),

      addButton.trailingAnchor.constraint(equalTo: customNavBar.trailingAnchor, constant: -20),
      addButton.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor, constant: 20),
      addButton.widthAnchor.constraint(equalToConstant: 30),
      addButton.heightAnchor.constraint(equalToConstant: 30),
      
      customNavBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      customNavBar.heightAnchor.constraint(equalToConstant: 100),
    ])
    
  }
  
  fileprivate func configureCollectionView() {
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemBackground
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    
    NSLayoutConstraint.activate([
       collectionView.topAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: 10),
       collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
       collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
       collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
     ])
  }
  
  @objc fileprivate func handleSearch(){
    print(#function)
  
  }
  
  @objc func handleAdd() {
    print(#function)
  
  }
}
