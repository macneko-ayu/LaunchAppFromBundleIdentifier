//
//  AppListViewModel.swift
//  LaunchAppFromBundleIdentifier
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import Cocoa

struct AppListViewModel {
    static let iconSize = NSSize(width: 120, height: 120)
    var items = [AppModel]()
    
    init?(bundleIdentifier: String) {
        guard let applicationUrls = LSCopyApplicationURLsForBundleIdentifier(bundleIdentifier as CFString, nil)?.takeUnretainedValue() as? [URL] else {
            return nil
        }
        for applicationUrl in applicationUrls {
            guard let model = AppModel(fileUrl: applicationUrl, iconSize: AppListViewModel.iconSize) else {
                break
            }
            items.append(model)
        }
    }
}
