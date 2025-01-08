//
//  File.swift
//  ZKCompoments
//
//  Created by 雷子康 on 2024/11/27.
//

import Foundation

extension Date {
    
    /// 生成一个随机日期
    public static func randomDate(start: Date = .distantPast, end: Date = .distantFuture) -> Date {
        guard start <= end else {
            fatalError("确保起始日期小于等于结束日期")
        } 
        
        let timeInterval = end.timeIntervalSince(start)
        let randomInterval = TimeInterval.random(in: 0...timeInterval)
        return start.addingTimeInterval(randomInterval)
    }
    
    /// 转化为字符串
    public func toString(dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
}
