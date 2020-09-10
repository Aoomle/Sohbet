//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class Profile: UIViewController {

  var collectionView: UITableView!
  let customNavBar = CustomNavBar()
  let titled = SHLabel(title: "Profile", textAlign: .center, fontSize: UIFont.preferredFont(forTextStyle: .largeTitle))
  
  var addButton = SHButton()
  
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
    
    addButton.setBackgroundImage(#imageLiteral(resourceName: "icons8-add_to_chat"), for: .normal)
  
    NSLayoutConstraint.activate([
      titled.centerYAnchor.constraint(equalTo: customNavBar.centerYAnchor, constant: 20),
      titled.leadingAnchor.constraint(equalTo: customNavBar.leadingAnchor, constant: 10),
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
    collectionView = UITableView(frame: .zero, style: .plain)
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemBackground
    collectionView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    
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
