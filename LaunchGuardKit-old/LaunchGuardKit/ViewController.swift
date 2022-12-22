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

    // Enable debug logging
    LaunchGuard.debug = true
    
    let blocklist = ["org.m0k.transmission"]
    launchGuard.add(blocklist: blocklist)
  }


}

