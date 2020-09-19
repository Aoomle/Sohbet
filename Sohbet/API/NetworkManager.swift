//
//  NetworkManager.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 15/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import Foundation
import Firebase


class NetworkingManager {
  static let shared = NetworkingManager()
  
  private init(){}
  
  fileprivate func createUser(email: String, password: String, completion: @escaping ((String?) -> Void) ) {
    Auth.auth().createUser(withEmail: email, password: password) { (success, error) in
      
      if let error = error {
        completion(error.localizedDescription)
        return
      }
      
    }
  }
  
  
  
  func userIsLoggedIn() -> Bool {
    if Auth.auth().currentUser != nil {
      return true
    }
    return false
  }
  
  func userIsLogOut() -> Bool {
    if Auth.auth().currentUser != nil {
      do {
        try Auth.auth().signOut()
        return true
      } catch {
        return false
      }
    }
    return false
  }
  
  func signInUser(email: String, password: String, completion: @escaping ((String?) -> Void) ) {
    Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
      if let error = error {
        self.errorHandler(err: error as NSError, completion: completion)
        return
      }
      //
      completion(nil)
    }
  }
  
  func signUpUser(email: String, password: String, completion: @escaping ((String?) -> Void)) {
    Auth.auth().createUser(withEmail: email, password: password) { (data, err) in
      if let error = err {
        self.errorHandler(err: error as NSError, completion: completion)
        return
      }
      completion(nil)
      //save to storage
      //save to database
    }
  }
  
  
  
  
  
  
  ///STORAGE
  func saveToStorage(upload: Data, completion: @escaping ((String?) -> Void)) {
    let filename = UUID().uuidString
    let ref = Storage.storage().reference().child("profile_images").child(filename)
    ref.putData(upload, metadata: nil) { (metadata, err) in
      if let err = err {
        completion(err.localizedDescription)
//           self.startJG(titleError: "Signing Up Failed..", messageError: err.localizedDescription)
      }

    ref.downloadURL { (imageUrl, err) in
      if let err = err {
        completion(err.localizedDescription)
//            self.startJG(titleError: err.localizedDescription, messageError: "")
        return
      }
      
      print("Downloading of our url image....", imageUrl?.absoluteString ?? "")
               
      }
    }
  }
  
  
  
  private func errorHandler(err: NSError, completion: @escaping ((String?) ->Void)) {
    if let codeError = AuthErrorCode(rawValue: err.code) {
      switch codeError {
      case .userNotFound:
        completion(ErrorMessage.USER_NOT_FOUND.rawValue)
      case .emailAlreadyInUse:
        completion(ErrorMessage.EMAIL_ALREADY_IN_USE.rawValue)
      case .weakPassword:
        completion(ErrorMessage.WEAK_PASSWORD.rawValue)
      case .wrongPassword:
        completion(ErrorMessage.WRONG_PASSWORD.rawValue)
//      case .user
      default:
        completion(ErrorMessage.PROBLEM_CONNECTION.rawValue)
        break
      }
    }
  }
}


//NetworkingManager.shared.createUser(email: "", password: "") { (<#Result<String, Error>#>) in
//  <#code#>
//}


