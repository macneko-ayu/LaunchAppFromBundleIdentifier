//
//  AppListViewController.swift
//  LaunchAppFromBundleIdentifier
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import Cocoa

class AppListViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var appListArrayController: NSArrayController!
    @objc dynamic var viewModel = AppListViewModel(bundleIdentifiers: ["com.adobe.illustrator"])
//    var viewModel: AppListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewModel = AppListViewModel(bundleIdentifiers: ["com.apple.dt.xcode"])
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

