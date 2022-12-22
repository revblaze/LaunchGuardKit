//
//  LaunchGuard.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import AppKit

open class LaunchGuard: NSObject {
  
  static let shared = LaunchGuard()
  
  fileprivate let workspace = NSWorkspace.shared
  fileprivate let notificationCenter = NSWorkspace.shared.notificationCenter
  
  static let ApplicationDidLaunchNotification = NSNotification.Name("LGApplicationDidLaunchNotification")
  
  public override init() {
    // pre var setup
    super.init()
    // notifs & other post-init
    notificationCenter.addObserver(self,
                                   selector: #selector(self.newRunningAppDidLaunch(_:)),
                                   name: NSWorkspace.didLaunchApplicationNotification,
                                   object: nil)
  }
  
}

extension LaunchGuard {
  
  @objc func newRunningAppDidLaunch(_ notification: Notification) {
    print("New Launch: \(recentlyLaunched())")
  }
  
  public func runningApplications() -> [NSRunningApplication] {
    return workspace.runningApplications
  }
  
  public func runningAppNames() -> [String] {
    var names: [String] = []
    for app in runningApplications() {
      if let name = app.localizedName {
        names.append(name)
      }
    }
    return names
  }
  
  public func runningBundleIds() -> [String] {
    var ids: [String] = []
    for app in runningApplications() {
      if let bundleId = app.bundleIdentifier {
        ids.append(bundleId)
      }
    }
    return ids
  }
  
  public func recentlyLaunchedAppName() -> String {
    if let name = runningAppNames().last {
      return name
    }
    return "N/A"
  }
  
  public func recentlyLaunchedBundleId() -> String {
    if let bundleId = runningBundleIds().last {
      return bundleId
    }
    return "N/A"
  }
  
  public func recentlyLaunched() -> String {
    var recentlyLaunched = ""
    if let name = runningAppNames().last {
      recentlyLaunched = name
    }
    if let bundleId = runningBundleIds().last {
      recentlyLaunched.append(": \(bundleId)")
    }
    return recentlyLaunched
  }
  
  
  
  public func runningAppNamesAndBundleIds() -> [String] {
    var ids: [String] = []
    let runningApps = runningApplications()
    
    for app in runningApps {
      if let name = app.localizedName {
        ids.append(name)
      }
      if let bundleId = app.bundleIdentifier {
        ids.append(bundleId)
      }
    }
    
    return ids
  }
  
}
