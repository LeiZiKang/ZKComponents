//
//  File.swift
//  ZKCompoments
//
//  Created by 雷子康 on 2024/11/1.
//

import Foundation

/// get file size
///
/// - Parameter url: url
/// - Returns: Double file size
public func getFileSize(_ url:String) -> Double {
    if let fileData:Data = try? Data.init(contentsOf: URL.init(fileURLWithPath: url)) {
        let size = Double(fileData.count)
        return size
    }
    return 0.00
}

extension Double {
    
  public  func fizeSizeKB() -> Double {
        return self/(1024.0)
    }
    
   public  func fileSizeMB() -> Double {
        return self/Double(1024 * 1024)
    }
    
    public func fileSizeGB() -> Double {
        return self/Double(1024 * 1024 * 1024)
    }
}
