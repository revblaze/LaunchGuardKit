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
      commandAll(.forceQuit, appNames: Blocklist.appNames)
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
  
  public func addBlocklist(appNames: [String]) {
    for name in appNames {
      Blocklist.appNames.append(name)
    }
    // check currently running apps too
    commandAll(.forceQuit, appNames: appNames)
  }
  
  public func clearBlocklist() {
    Blocklist.appNames = []
    Blocklist.bundleIds = []
  }
  
}
