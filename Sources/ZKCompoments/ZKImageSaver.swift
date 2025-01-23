//
//  ImageSaver.swift
//  ZKCompoments
//
//  Created by Lei Levi on 24/1/2025.
//

import UIKit
import OSLog

public class ZKImageSaver: NSObject {
    
    let logger = Logger(subsystem: "ImageSaver/ZKComponents", category: "ImageSaver")
    
    public func writeToPhotoAlbum(image: UIImage, completion: @escaping (Result<Void, Error>) -> Void) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), Unmanaged.passRetained(CallbackWrapper(completion: completion)).toOpaque())
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        let callbackWrapper = Unmanaged<CallbackWrapper>.fromOpaque(contextInfo).takeRetainedValue()
        if let error {
            self.logger.error("image save fail: \(error.localizedDescription)")
            callbackWrapper.completion(.failure(error))
        } else {
            self.logger.info("image Saved Suceessfully")
            callbackWrapper.completion(.success(()))
        }
    }
    
    private class CallbackWrapper {
        let completion: (Result<Void, Error>) -> Void
        
        init(completion: @escaping (Result<Void, Error>) -> Void) {
            self.completion = completion
        }
    }
}




