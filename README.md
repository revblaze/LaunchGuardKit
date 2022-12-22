# LaunchGuardKit
An open source development kit for the components featured in LaunchGuard for macOS.

## Setup

Drag and drop `/LaunchGuardKit` into your project

## Getting Started

While you can use the app's localized name to interact with it, it's recommended that you mostly work with the bundle identifier instead. There are multiple benefits to this; the most important being that the `bundleId` is more unique and unlikely to change.

```swift
let launchGuard = LaunchGuard.shared

func viewDidLoad() {
  // Enable debug console (optional)
  LaunchGuard.debug = true
  
  // Get currently running apps
  launchGuard.apps()            // ["App 1", "com.bundle.app1", "App 2", "com.bundle.app2", ...]
  launchGuard.apps(.name)       // ["App 1", "App 2", ...]
  launchGuard.apps(.bundleId)   // ["com.bundle.app1", "com.bundle.app2", ...]
}
```

## Blocklist

The Blocklist will allow you to block applications from launching by bundle identifier, name, etc.

```swift
// By bundle identifier
let list = ["com.apple.Music", "com.github.GitHubClient"]
launchGuard.add(blocklist: list)

// By app name
let list = ["Music", "GitHub Client"]
launchGuard.add(blocklist: list, format: .name)
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
