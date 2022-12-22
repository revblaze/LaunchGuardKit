//
//  LaunchGuard.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import AppKit

open class LaunchGuard: NSObject {
  
  static let shared = LaunchGuard()
  
  static var debug = false
  
  fileprivate let workspace = NSWorkspace.shared
  fileprivate let notificationCenter = NSWorkspace.shared.notificationCenter
  
  static let ApplicationDidLaunchNotification = NSNotification.Name("LGApplicationDidLaunchNotification")
  
  public override init() {
    // pre var setup
    super.init()
    // notifs & other post-init
    notificationCenter.addObserver(self,
                                   selector: #selector(self.newRunningApplicationDidLaunch(_:)),
                                   name: NSWorkspace.didLaunchApplicationNotification,
                                   object: nil)
  }
  
}

extension LaunchGuard {
  
  @objc func newRunningApplicationDidLaunch(_ notification: Notification) {
    let app: NSRunningApplication = notification.userInfo![NSWorkspace.applicationUserInfoKey] as! NSRunningApplication
    if let name = app.localizedName {
      if let bundleId = app.bundleIdentifier {
        // Do something
        Debug.log("[LAUNCH] \(name) [\(bundleId)]")
      }
    }
    filterBlocklist()
  }
  
  
  
  // MARK: - Utility
  
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
  
  
  
  // MARK: - Recently Launched
  
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
      recentlyLaunched.append(" [\(bundleId)]")
    }
    return recentlyLaunched
  }
  
}
