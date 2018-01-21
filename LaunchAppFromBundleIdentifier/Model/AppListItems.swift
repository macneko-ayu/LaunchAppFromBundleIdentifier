//
//  AppListItems.swift
//  LaunchAppFromBundleIdentifier
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import Cocoa

struct AppListItems {
    let items: [AppListItem]
    
    init(bundleIdentifiers: [String]) {
        var result = [AppListItem]()
        bundleIdentifiers.forEach { (identifier: String) in
            // BundleIdentifierにマッチするApplicationのファイルUrlを取得
            // 同じBundleIdentifierのApplicationがインストールされている場合もあり得るので配列となる
            guard let appUrls = LSCopyApplicationURLsForBundleIdentifier(identifier as CFString, nil)?.takeUnretainedValue() as? [URL] else {
                return
            }
            let apps = appUrls.flatMap { (appUrl: URL) -> AppListItem? in
                guard let bundle = Bundle(url: appUrl), let identifier = bundle.bundleIdentifier, let infoDictionary = bundle.infoDictionary else {
                    return nil
                }
                let path = appUrl.path
                let name = FileManager.default.displayName(atPath: path)
                let icon = NSWorkspace.shared.icon(forFile: path)
                let version = infoDictionary["CFBundleVersion"] as? String ?? "unknown"
                
                let runningApps = NSWorkspace.shared.runningApplications as [NSRunningApplication]
                let regularApps = runningApps.filter {
                    $0.activationPolicy == NSApplication.ActivationPolicy.regular
                }
                let bundleUrls = regularApps.map { $0.bundleURL! }
                let activeState = bundleUrls.filter { $0.path == appUrl.path }.count > 0
                
                return AppListItem(name: name, url: appUrl, identifier: identifier, version: version, icon: icon, isActive: activeState)
            }
            result.append(contentsOf: apps)
        }
//        let lists = bundleIdentifiers.flatMap { (identifier: String) -> [AppListItem]? in
//            // BundleIdentifierにマッチするApplicationのファイルUrlを取得
//            // 同じBundleIdentifierのApplicationがインストールされている場合もあり得るので配列となる
//            guard let appUrls = LSCopyApplicationURLsForBundleIdentifier(identifier as CFString, nil)?.takeUnretainedValue() as? [URL] else {
//                return nil
//            }
//            let apps = appUrls.flatMap { (appUrl: URL) -> AppListItem? in
//                guard let bundle = Bundle(url: appUrl), let identifier = bundle.bundleIdentifier, let infoDictionary = bundle.infoDictionary else {
//                    return nil
//                }
//                let path = appUrl.path
//                let name = FileManager.default.displayName(atPath: path)
//                let icon = NSWorkspace.shared.icon(forFile: path)
//                let version = infoDictionary["CFBundleVersion"] as? String ?? "unknown"
//
//                let runningApps = NSWorkspace.shared.runningApplications as [NSRunningApplication]
//                let regularApps = runningApps.filter {
//                    $0.activationPolicy == NSApplication.ActivationPolicy.regular
//                }
//                let bundleUrls = regularApps.map { $0.bundleURL! }
//                let activeState = bundleUrls.filter { $0.path == appUrl.path }.count > 0
//
//                return AppListItem(name: name, url: appUrl, identifier: identifier, version: version, icon: icon, isActive: activeState)
//            }
//            return apps
//        }
//        hoges.forEach {
//            result.append(contentsOf: $0.map { return $0} )
//        }
        
        self.items = result
    }

    struct AppListItem {
        let name: String
        let url: URL
        let identifier: String
        let version: String
        var icon: NSImage?
        let isActive: Bool
        
        init(name: String, url: URL, identifier: String, version: String, icon: NSImage?, isActive flag: Bool) {
            self.name = name
            self.url = url
            self.identifier = identifier
            self.version = version
            self.icon = icon
            self.isActive = flag
        }
    }
}


