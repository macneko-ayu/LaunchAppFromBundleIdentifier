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

    func testInitializeFromValidBundleIdentifier() {
        let viewModel = AppListViewModel(bundleIdentifier: "com.apple.dt.xcode")
        XCTAssertTrue(viewModel!.items.count >= 0)
        let model = viewModel!.items.first
        XCTAssertEqual(model!.displayName, "Xcode.app")
        XCTAssertEqual(model!.bundleIdentifier, "com.apple.dt.Xcode")
        XCTAssertEqual(model!.bundleVersion, "13532")
        XCTAssertNotNil(model!.icon)
        XCTAssertEqual(model!.filePath, "/Applications/Xcode.app")
        XCTAssertEqual(model!.isActive, false)
    }
    
    func testInitializeFromInValidBundleIdentifier() {
        let viewModel = AppListViewModel(bundleIdentifier: "com.hoge.fuga")
        XCTAssertNil(viewModel)
    }

}
