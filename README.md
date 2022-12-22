# LaunchGuardKit
An open source development kit for the components featured in LaunchGuard for macOS.

## Setup

Drag and drop `/LaunchGuardKit` into your project

## Getting Started

```swift
let launchGuard = LaunchGuard.shared

func viewDidLoad() {
  // Enable debug console
  LaunchGuard.debug = true
  
  launchGuard.apps(.ids)   // ["com.bundle.app1", "com.bundle.app2", ...]
  launchGuard.apps(.names) // ["App 1", "App 2", ...]
  launchGuard.apps(.all)   // ["App 1", "com.bundle.app1", "App 2", "com.bundle.app2", ...]
}
```

## Blocklist

The Blocklist will allow you to block applications from launching by bundle identifier, name, etc.

```swift
// By bundle identifier
let blocklist = ["com.apple.Music", "com.github.GitHubClient"]
launchGuard.addBlocklist(blocklist)

// By app name
let blocklist = ["Music", "GitHub Client"]
launchGuard.addBlocklist(appNames: blocklist)
```

## Commands

You can issue customizable commands to specific applications as well:

```swift
// Quit the Music app
let music = "com.apple.Music"
launchGuard.command(.quit, bundleId: music)
// Force quit multiple apps
let apps = ["com.apple.Music", "com.github.GitHubClient"]
launchGuard.commandAll(.forceQuit, bundleIds: apps)
```
