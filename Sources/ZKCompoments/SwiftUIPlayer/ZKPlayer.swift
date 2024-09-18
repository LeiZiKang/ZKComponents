// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 14.0, *)
public struct ZKPlayer: View {
    
    @ObservedObject public var viewModel: PlayerViewModel
    public init(url: URL, timecodes: [Timecode]) {
        self.viewModel = PlayerViewModel(url: url, timecodes: timecodes)
    }

    public var body: some View {
        VideoPlayerView(player: viewModel.player, timecodes: viewModel.timecodes)
    }
}
