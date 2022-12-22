//
//  ViewController.swift
//  DaemonTest
//
//  Created by Justin Bush on 11/15/22.
//

import Cocoa

class ViewController: NSViewController {

  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    runDaemonNotification()
  }
  
  func runDaemonNotification() {
    let notificationCenter = NSWorkspace.shared.notificationCenter
    notificationCenter.addObserver(self,
                                   selector: #selector(self.appDidLaunch(_:)),
                                   name: NSWorkspace.didLaunchApplicationNotification,
                                   object: nil)
  }

  
  @objc func appDidLaunch(_ notification: Notification) {
    let app: NSRunningApplication = notification.userInfo![NSWorkspace.applicationUserInfoKey] as! NSRunningApplication
    if app.bundleIdentifier == "com.apple.Music" {
      print("com.apple.Music")//app.terminate()
      print("app: \(app)")
    }
    if app.bundleIdentifier == "org.mozilla.Firefox" {
      print("Firefox is running")
    }
  }
  
  @objc func activeSpaceDidChange(_ notification: Notification) {
    let app: NSRunningApplication = notification.userInfo![NSWorkspace.applicationUserInfoKey] as! NSRunningApplication
    if app.bundleIdentifier == "com.apple.Music" {
      print("com.apple.Music")//app.terminate()
      //app.terminate()
    }
    if app.bundleIdentifier == "org.mozilla.Firefox" {
      print("Firefox is running")
    }
  }
  
  @IBAction func getRunningApps(_ sender: NSButton) {
    let workspace = NSWorkspace.shared
    let runningApps = workspace.runningApplications
    print(runningApps)
  }
  
  @IBAction func quitMusicApp(_ sender: NSButton) {
    let workspace = NSWorkspace.shared
    let runningApps = workspace.runningApplications
    
    let musicApp = NSRunningApplication.runningApplications(withBundleIdentifier: "com.apple.Music")
    
    if musicApp != [] {
      print("music app is running\n \(musicApp)")
      musicApp[0].terminate()
      //musicApp[0].forceTerminate()
    }
    
    let infuseApp = NSRunningApplication.runningApplications(withBundleIdentifier: "com.firecore.infuse")
    print("Infuse is running; attempting quit:")
    print(infuseApp[0].terminate())
    
    //print(musicApp)
  }



}

extension Notification.Name {
    static let didFinishLaunchingApplication = Notification.Name("purchaseDidFinish")
}
