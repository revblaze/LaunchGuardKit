//
//  ViewController.swift
//  LaunchGuardKit
//
//  Created by Justin Bush on 12/22/22.
//

import Cocoa

class ViewController: NSViewController {
  
  let launchGuard = LaunchGuard.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()

    print(launchGuard.runningBundleIds())
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

