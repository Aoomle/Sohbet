//
//  UIViewController+Ext.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 05/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func presentSHAlertOnMainThread(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertVC = SHAlertView(title: title, message: message, buttonTitle: buttonTitle)
      alertVC.modalTransitionStyle = .crossDissolve
      alertVC.modalPresentationStyle = .overFullScreen
      self.present(alertVC, animated: true, completion: nil)
    }
  }
}
