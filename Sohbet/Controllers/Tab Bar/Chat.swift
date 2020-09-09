//
//  Calls.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class Chat: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.title = "Chat"
      navigationItem.rightBarButtonItems = [
        SHBarButton(barButtonSystemItem: .search, target: self, action: #selector(addCalls)),
        SHBarButton(barButtonSystemItem: .add, target: self, action: #selector(addCalls))
      ]
      
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
    cell.textLabel?.text = "Abdulmalik Muhammad"
    return cell
  }
  
//  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 70
//  }
  
  @objc fileprivate func addCalls() {
    
  }
}
