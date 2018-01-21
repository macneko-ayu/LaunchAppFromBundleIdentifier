//
//  AppListViewModelTests.swift
//  LaunchAppFromBundleIdentifierTests
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import XCTest
@testable import LaunchAppFromBundleIdentifier

class AppListViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitializeFromValidBundleIdentifiers() {
        let viewModel = AppListViewModel(bundleIdentifiers: ["com.apple.dt.xcode"])
        XCTAssertNotNil(viewModel)
        XCTAssertTrue(viewModel.items.count > 0)
        let model = viewModel.items.first
        XCTAssertEqual(model!.name, "Xcode.app")
        XCTAssertEqual(model!.identifier, "com.apple.dt.Xcode")
        XCTAssertNotNil(model!.version)
        XCTAssertNotNil(model!.icon)
        XCTAssertEqual(model!.url, URL(fileURLWithPath: "/Applications/Xcode.app"))
        XCTAssertEqual(model!.isActive, true)
    }

    func testInitializeFromInValidBundleIdentifiers() {
        let viewModel = AppListViewModel(bundleIdentifiers: ["com.hoge.fuga"])
        XCTAssertNotNil(viewModel)
        XCTAssertTrue(viewModel.items.count == 0)
    }
    
    func testIntializeFromMixBundleIdentifiers() {
        let viewModel = AppListViewModel(bundleIdentifiers: ["com.apple.dt.xcode", "com.hoge.fuga"])
        XCTAssertNotNil(viewModel)
        XCTAssertTrue(viewModel.items.count == 1)
    }
}
