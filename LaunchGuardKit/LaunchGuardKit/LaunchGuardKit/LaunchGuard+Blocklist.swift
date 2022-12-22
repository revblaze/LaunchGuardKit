//
//  LaunchGuard+Blocklist.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import Foundation

extension LaunchGuard {
  
  struct Blocklist {
    static var bundleIds: [String] = []
    static var appNames: [String] = []
  }
  
  func filterBlocklist() {
    if Blocklist.appNames != [] {
      
    }
    if Blocklist.bundleIds != [] {
      commandAll(.forceQuit, bundleIds: Blocklist.bundleIds)
    }
  }
  
  public func addBlocklist(_ bundleIds: [String]) {
    for bundleId in bundleIds {
      Blocklist.bundleIds.append(bundleId)
    }
    // check currently running apps too
    commandAll(.forceQuit, bundleIds: bundleIds)
  }
  
}
