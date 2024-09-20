//
//  File.swift
//
//
//  Created by MEETU on 3/9/2024.
//

import Foundation
import UIKit

// MARK: - Constant

/// 状态栏高度
public let zkStatusBarH =  UIApplication.shared.statusBarFrame.size.height

///设备屏幕宽
public let screenW = Device.current.screenSize.width

/// 设备屏幕高
public let screenH = Device.current.screenSize.height

/// app 版本
public let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

/// appDisplayName
public let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String


// MARK: - Function

/// 复制到剪切板
public func zkCopyToClipboard(text: String, completion: @escaping() -> Void) {
    UIPasteboard.general.string = text
    completion()
}
