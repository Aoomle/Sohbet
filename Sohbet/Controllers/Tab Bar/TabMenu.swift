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
      generateController(viewController: Calls(), title: "Calls"),
      generateController(viewController: Chat(), title: "Chats"),
      generateController(viewController: Profile(), title: "Profile")
    ]
  }
  
  fileprivate func generateController(viewController: UIViewController, title: String, image: UIImage = .actions) -> UINavigationController {
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    navController.navigationBar.prefersLargeTitles = true
    return navController
  }
}
