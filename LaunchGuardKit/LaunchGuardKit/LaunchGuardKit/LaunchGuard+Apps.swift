//
//  LaunchGuard+Apps.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import Foundation

extension LaunchGuard {
  
  public enum Format {
    case bundleId, name
  }
  
  public func apps() -> [String] {
    return runningApplicationLocalizedNamesAndBundleIds()
  }
  
  public func apps(_ format: Format) -> [String] {
    switch format {
    case .bundleId: return runningApplicationBundleIds()
    case .name: return runningApplicationLocalizedNames()
    }
  }
  
  public func mostRecent() -> [String] {
    return mostRecentApplicationLocalizedNameAndBundleId()
  }
  
  public func mostRecent(_ format: Format) -> String {
    switch format {
    case .bundleId: return mostRecentApplicationBundleId()
    case .name: return mostRecentApplicationLocalizedName()
    }
  }
  
  
  
  // MARK: - Accessors
  
  fileprivate func runningApplicationLocalizedNames() -> [String] {
    var names: [String] = []
    for app in runningApplications() {
      if let name = app.localizedName {
        names.append(name)
      }
    }
    return names
  }
  
  fileprivate func runningApplicationBundleIds() -> [String] {
    var ids: [String] = []
    for app in runningApplications() {
      if let bundleId = app.bundleIdentifier {
        ids.append(bundleId)
      }
    }
    return ids
  }
  
  fileprivate func runningApplicationLocalizedNamesAndBundleIds() -> [String] {
    var ids: [String] = []
    for app in runningApplications() {
      if let name = app.localizedName {
        ids.append(name)
      }
      if let bundleId = app.bundleIdentifier {
        ids.append(bundleId)
      }
    }
    return ids
  }
  
  fileprivate func mostRecentApplicationLocalizedName() -> String {
    if let name = runningApplicationLocalizedNames().last {
      return name
    }
    return "N/A"
  }
  
  fileprivate func mostRecentApplicationBundleId() -> String {
    if let bundleId = runningApplicationBundleIds().last {
      return bundleId
    }
    return "N/A"
  }
  
  fileprivate func mostRecentApplicationLocalizedNameAndBundleId() -> [String] {
    return [mostRecentApplicationLocalizedName(), mostRecentApplicationBundleId()]
  }
}
