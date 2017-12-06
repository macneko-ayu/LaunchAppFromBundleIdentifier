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
    var icon: NSImage? = nil
    let filePath: String
    var isActive: Bool = false
    
    init?(fileUrl: URL, iconSize: NSSize) {
        guard let filePath = fileUrl.path.removingPercentEncoding else {
            return nil
        }
        let plistPath = filePath + "/Contents/Info.plist"
        if !FileManager.default.fileExists(atPath: plistPath) {
            return nil
        }
        guard let infoDictionary = NSDictionary(contentsOfFile: plistPath) else {
            return nil
        }
        self.displayName = FileManager.default.displayName(atPath: filePath)
        self.bundleIdentifier = infoDictionary["CFBundleIdentifier"] as? String ?? ""
        self.bundleVersion = infoDictionary["CFBundleVersion"] as? String ?? ""
        self.filePath = filePath
        if let iconFilePath = infoDictionary["CFBundleIconFile"] as? String {
            self.icon = generateIconImage(filePath: filePath + "/Contents/Resources/" + iconFilePath, iconSize: iconSize)
        }
    }
    
    private func generateIconImage(filePath: String, iconSize: NSSize) -> NSImage? {
        var imagePath = filePath
        if !imagePath.hasSuffix(".icns") {
            imagePath += ".icns"
        }
        let iconImage = NSImage(contentsOfFile: imagePath)
        iconImage?.size = iconSize
        iconImage?.lockFocus()
        NSGraphicsContext.current?.imageInterpolation = .high
        iconImage?.draw(in: CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height))
        iconImage?.unlockFocus()
        return iconImage
    }
}
