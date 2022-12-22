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
  
  
  
  // MARK: - Recently Launched
  
  
  
}
