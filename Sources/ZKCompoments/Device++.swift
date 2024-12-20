//
//  Utils.swift
//  Example
//
//  Created by Alisa Mylnikova on 10/06/2021.
//

import SwiftUI
import Device
import UIKit

extension Device {
    /// 当前设备的名字
    public var deviceName: String {
        UIDevice.current.name
    }
}

