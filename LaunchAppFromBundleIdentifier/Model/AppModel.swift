//
//  AppModel.swift
//  LaunchAppFromBundleIdentifier
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import Cocoa

struct AppModel {
    let displayName: String
    let bundleIdentifier: String
    let bundleVersion: String
    var icon: NSImage?
    let filePath: String
    var isActive: Bool = false
    
    init(displayName: String, bundleIdentifier: String, bundleVersion: String, icon: NSImage?, filePath: String) {
        self.displayName = displayName
        self.bundleIdentifier = bundleIdentifier
        self.bundleVersion = bundleVersion
        self.icon = icon
        self.filePath = filePath
    }
}
