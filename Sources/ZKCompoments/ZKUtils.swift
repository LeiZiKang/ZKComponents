//
//  Utils.swift
//  Example
//
//  Created by Alisa Mylnikova on 10/06/2021.
//

import SwiftUI
import Device

extension Device {
    
    /// 当前设备的名字
    public var deviceName: String {
        UIDevice.current.name
    }
}
extension Collection {

    /// 防止发生数组越界
    /// Returns the element at the specified index if it exists, otherwise nil.
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
