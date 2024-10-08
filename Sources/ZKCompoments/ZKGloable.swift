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
public let screenW = Device.current.screenSize.width

/// 设备屏幕高
public let screenH = Device.current.screenSize.height




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
