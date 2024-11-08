//
//  File.swift
//  ZKCompoments
//
//  Created by 雷子康 on 2024/9/27.
//

import Foundation

public struct ZKApp {
    
    /// app 版本
    public static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

    /// appDisplayName
    public static let display_name = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
    
}
