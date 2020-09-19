//
//  ErrorMessage.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 08/09/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
  case failed = "failed"
  case NETWROK_ERROR = "Network Error"
  case WRONG_PASSWORD = "Wrong password"
  case PROBLEM_CONNECTION = "Issue connecting to the server, Please try again later."
  case USER_NOT_FOUND = "User doesn't exists, Please sign up."
  case EMAIL_ALREADY_IN_USE = "Email already in use, please use another email."
  case WEAK_PASSWORD = "Password should be at least 6 characters long."
  
}
