//
//  TabMenu.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

class TabMenu: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBar.tintColor = .label
    configure()
  }
  
  
  fileprivate func configure() {
    
    viewControllers = [
      generateController(viewController: Calls(), title: "Calls", image: #imageLiteral(resourceName: "call")),
      generateController(viewController: Chat(), title: "Chats", image: #imageLiteral(resourceName: "chat")),
      generateController(viewController: Profile(), title: "Profile", image: #imageLiteral(resourceName: "profile"))
    ]
  }
  
  fileprivate func generateController(viewController: UIViewController, title: String, image: UIImage = .actions) -> UINavigationController {
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    navController.navigationBar.prefersLargeTitles = false
    navController.setNavigationBarHidden(true, animated: true)
    return navController
  }
}
