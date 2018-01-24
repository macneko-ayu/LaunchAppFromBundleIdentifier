//
//  AppListViewModel.swift
//  LaunchAppFromBundleIdentifier
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import Cocoa
import RxSwift

class AppListViewModel: NSObject {
    @objc var items: [AppListItems.AppListItem]
    
    init(bundleIdentifiers: [String]) {
        self.items = AppListItems(bundleIdentifiers: bundleIdentifiers).items
    }
}
