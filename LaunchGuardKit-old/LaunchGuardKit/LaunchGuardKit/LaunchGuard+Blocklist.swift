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
  
  public func add(blocklist: [String], format: Format = .bundleId) {
    switch format {
    case .bundleId: addBlocklist(bundleIds: blocklist)
    case .name: addBlocklist(appNames: blocklist)
    }
    // Block currently running apps
    filterBlocklist()
  }
  
  fileprivate func addBlocklist(bundleIds: [String]) {
    for bundleId in bundleIds {
      Blocklist.bundleIds.append(bundleId)
    }
  }
  
  fileprivate func addBlocklist(appNames: [String]) {
    for name in appNames {
      Blocklist.appNames.append(name)
    }
  }
  
  public func clearBlocklist() {
    Blocklist.appNames = []
    Blocklist.bundleIds = []
  }
  
}
