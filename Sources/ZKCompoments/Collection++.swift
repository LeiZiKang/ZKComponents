//
//  File.swift
//  ZKCompoments
//
//  Created by 雷子康 on 2024/11/21.
//

import Foundation

extension Collection {

    /// 防止发生数组越界
    /// Returns the element at the specified index if it exists, otherwise nil.
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
