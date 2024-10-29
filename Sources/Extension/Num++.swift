//
//  File.swift
//  ZKCompoments
//
//  Created by 雷子康 on 2024/10/21.
//

import Foundation

extension Double {
    
    /// 转化为两位小数字符串
    public func twoDecimalPlacesStr () -> String {
        return String(format: "%.2f", self)
    }
    
    /// 转化为整数
    public func toInt () -> Int {
        return Int(self)
    }
}
