//
//  LaunchGuard+Command.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import AppKit

extension LaunchGuard {
  
  public enum Command {
    case quit, forceQuit
  }
  
  private func sendCommand(_ command: Command, app: NSRunningApplication) {
    var bundleId: String = ""
    if let bundleIdentifier = app.bundleIdentifier {
      bundleId = bundleIdentifier
    }
    switch command {
    case .quit:
      app.terminate()
      Debug.log("[QUIT] \(bundleId)")
    case .forceQuit:
      app.forceTerminate()
      Debug.log("[FORCE QUIT] \(bundleId)")
    }
  }
  
  public func command(_ command: Command, bundleId: String) {
    for app in runningApplications() {
      if app.bundleIdentifier == bundleId {
        sendCommand(command, app: app)
      }
    }
  }
  
  public func commandAll(_ command: Command, bundleIds: [String]) {
    for app in runningApplications() {
      for bundleId in bundleIds {
        if app.bundleIdentifier == bundleId {
          sendCommand(command, app: app)
        }
      }
    }
  }
  
  public func commandAll(_ command: Command, appNames: [String]) {
    for app in runningApplications() {
      for name in appNames {
        if app.localizedName == name {
          sendCommand(command, app: app)
        }
      }
    }
  }
  
  /// ie. `*.adobe.*`
  public func command(_ command: Command, wildcardBundleId: String) {
    
  }
  
  
  
  // MARK: - Utility Functions
  
  
  
}
