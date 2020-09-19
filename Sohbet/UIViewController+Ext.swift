//
//  UIViewController+Ext.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 05/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showAlert(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertVC = SHAlertView(title: title, message: message, buttonTitle: buttonTitle)
      alertVC.modalTransitionStyle = .crossDissolve
      alertVC.modalPresentationStyle = .overFullScreen
      self.present(alertVC, animated: true, completion: nil)
    }
  }
  
  func showError(message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertVC = SHAlertViewError(message: message, buttonTitle: buttonTitle)
      alertVC.actionButton.setTitleColor(.systemBackground, for: .normal)
      alertVC.actionButton.backgroundColor = .label
      alertVC.modalTransitionStyle = .crossDissolve
      alertVC.modalPresentationStyle = .overFullScreen
      self.present(alertVC, animated: true, completion: nil)
    }
  }
  
  func startLoading() {
    let showVC = SHActivityView(message: "Please Wait...")
    showVC.activityLoader.startAnimating()
    showVC.modalTransitionStyle = .crossDissolve
    showVC.modalPresentationStyle = .overFullScreen
    self.present(showVC, animated: true, completion: nil)
  }
  
  func stopLoading() {
     let showVC = SHActivityView()
     showVC.modalTransitionStyle = .crossDissolve
     showVC.activityLoader.stopAnimating()
     showVC.modalPresentationStyle = .overFullScreen
     self.present(showVC, animated: true, completion: nil)
   }
  
}
