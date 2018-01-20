//
//  AppModelTests.swift
//  LaunchAppFromBundleIdentifierTests
//
//  Created by 横田孝次郎 on 2017/12/06.
//  Copyright © 2017年 macneko. All rights reserved.
//

import XCTest
@testable import LaunchAppFromBundleIdentifier

class AppModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitislizeFromValidFileUrl() {
        let fileUrl = URL(fileURLWithPath: "/Applications/Xcode.app")
        let model = AppModel(fileUrl: fileUrl, iconSize: NSSize(width: 120, height: 120))
        XCTAssertEqual(model!.displayName, "Xcode.app")
        XCTAssertEqual(model!.bundleIdentifier, "com.apple.dt.Xcode")
        XCTAssertNotNil(model!.bundleVersion)
        XCTAssertNotNil(model!.icon)
        XCTAssertEqual(model!.filePath, "/Applications/Xcode.app")
        XCTAssertEqual(model!.isActive, false)
    }
    
    func testInitislizeFromInValidFileUrl() {
        let fileUrl = URL(fileURLWithPath: "/hoge/hoge.app")
        let model = AppModel(fileUrl: fileUrl, iconSize: NSSize(width: 120, height: 120))
        XCTAssertNil(model)
    }
}
