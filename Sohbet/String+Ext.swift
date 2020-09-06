//
//  String+Ext.swift
//  Sohbet
//
//  Created by Abdulmalik Muhammad on 31/08/2020.
//  Copyright © 2020 Aoomle. All rights reserved.
//

import Foundation


extension String {

    var isEmailVaid: Bool {
           NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
       }
  
  func isPasswordValid() {
    
  }
}
