//
//  File.swift
//
//
//  Created by Айтолкун Анарбекова on 29.11.2023.
//

import Foundation
import AVKit

@available(iOS 14.0, *)
public class PlayerViewModel: ObservableObject {
    
    @Published public var player = AVPlayer()
    public var timecodes: [Timecode]
    
    public init(url: URL, timecodes: [Timecode]) {
        self.timecodes = timecodes
        player = AVPlayer(url: url)
    }
    
    deinit {
        
    }
    
}
