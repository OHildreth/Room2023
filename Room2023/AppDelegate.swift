//
//  AppDelegate.swift
//  Room2023
//
//  Created by Owen Hildreth on 2/1/23.
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        disableWindowButtons()
    }
    
    func disableWindowButtons() {
        for window in NSApplication.shared.windows {
            window.standardWindowButton(NSWindow.ButtonType.closeButton)?.isEnabled = false
        }
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        return .terminateNow
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        let nc = NotificationCenter.default
        
        nc.post(name: .applicationIsTerminating,
                object: nil)
    }
}

extension Notification.Name {
    static let applicationIsTerminating = Notification.Name("com.HRG.AppIsTerminating")
}
