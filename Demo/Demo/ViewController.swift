//
//  ViewController.swift
//  Demo
//
//  Created by Justin Bush on 12/22/22.
//

import Cocoa

class ViewController: NSViewController {

  let launchGuard = LaunchGuard.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let blocklist = ["com.apple.Music"]
    launchGuard.add(blocklist: blocklist)
    
    let runningApps = launchGuard.apps()
    print(runningApps)
    
  }
  
  override func viewWillDisappear() {
    // Quit this app on view close
    let thisApp = "io.wekit.LaunchGuardKit.Demo"
    launchGuard.command(.quit, bundleId: thisApp)
  }
  


}
