//
//  String+CF.swift
//  CherryFriends
//
//  Created by MEETU on 28/8/2024.
//

import Foundation

extension String {
 
    /// 转化为Date
    /// - Description:将一个"yyyy-MM-dd HH:mm:ss"格式的str转化为Date，例如`"2024-08-28 12:07:45"`
    /// - Returns: Date
    public func zkDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self)
    }
    
    
    /// 转化为在线 url
    public func onlineUrl() -> URL? {
        return URL(string: self)
    }
    
}
