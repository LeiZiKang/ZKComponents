//
//  File.swift
//
//
//  Created by MEETU on 3/9/2024.
//

import Foundation
import SwiftUI

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

// MARK: - Constant

#if os(ios)
/// 状态栏高度
public let zkStatusBarH =  UIApplication.shared.statusBarFrame.size.height
#endif


///设备屏幕宽
public let screenW = UIScreen.main.bounds.width

/// 设备屏幕高
public let screenH = UIScreen.main.bounds.height

/// app 版本
public var appVersion: String {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
}

/// diaplayName
public var appDisplayName: String {
    return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
}



// MARK: - Function

/// 复制到剪切板
public func zkCopyToClipboard(text: String, completion: @escaping() -> Void) {
    
#if os(iOS) || os(tvOS) || os(watchOS)
    let pastboard = UIPasteboard.general
    pastboard.string = text
#elseif os(OSX)
    let pastboard = NSPasteboard.general
    pastboard.setString(text, forType: .string)
#endif
    
    completion()
}
