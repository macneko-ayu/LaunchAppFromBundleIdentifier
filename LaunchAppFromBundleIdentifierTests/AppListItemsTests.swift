//
//  AppListItemsTests.swift
//  LaunchAppFromBundleIdentifierTests
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import XCTest
@testable import LaunchAppFromBundleIdentifier

class AppListItemsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitislizeAppListItem() {
        let model = AppListItems.AppListItem(name: "Xcode", url: URL(fileURLWithPath: "/Applications/Xcode.app"), identifier: "com.apple.dt.xcode", version: "1", icon: nil, isActive: false)
        XCTAssertNotNil(model)
    }

    func testInitializeFromValidBundleIdentifier() {
        let model = AppListItems(bundleIdentifiers: ["com.apple.dt.xcode"])
        XCTAssertNotNil(model)
        XCTAssertTrue(model.items.count > 0)
        let item = model.items.first
        XCTAssertEqual(item!.name, "Xcode.app")
        XCTAssertEqual(item!.identifier, "com.apple.dt.Xcode")
        XCTAssertNotNil(item!.version)
        XCTAssertNotNil(item!.icon)
        XCTAssertEqual(item!.url, URL(fileURLWithPath: "/Applications/Xcode.app"))
        XCTAssertEqual(item!.isActive, true)
    }
    
    func testInitializeFromInValidBundleIdentifier() {
        let model = AppListItems(bundleIdentifiers: ["com.hoge.fuga"])
        XCTAssertNotNil(model)
        XCTAssertTrue(model.items.count == 0)
    }

}
