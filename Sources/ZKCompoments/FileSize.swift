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
public func getFileSize(_ url:URL) throws  -> Double {
    let fileData:Data = try Data.init(contentsOf: url)
    let size = Double(fileData.count)
    return size
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
