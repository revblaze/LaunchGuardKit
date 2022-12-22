//
//  LaunchGuard+Debug.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import Foundation

extension LaunchGuard {
  
  struct Debug {
    static var isEnabled = LaunchGuard.debug
    
    static func log(_ content: Any) {
      if isEnabled {
        if let content = content as? String {
          print(content)
        }
      }
    }
    
  }
  
}
