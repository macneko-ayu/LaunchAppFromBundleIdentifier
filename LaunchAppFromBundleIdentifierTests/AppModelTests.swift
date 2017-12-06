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

    func testInitialize() {
        let model = AppModel(displayName: "Xcode.app", bundleIdentifier: "com.apple.dt.Xcode", bundleVersion: "13532", icon: nil, filePath: "/Applications/Xcode.app")
        XCTAssertEqual(model.displayName, "Xcode.app")
        XCTAssertEqual(model.bundleIdentifier, "com.apple.dt.Xcode")
        XCTAssertEqual(model.bundleVersion, "13532")
        XCTAssertEqual(model.icon, nil)
        XCTAssertEqual(model.filePath, "/Applications/Xcode.app")
        XCTAssertEqual(model.isActive, false)
    }
}
