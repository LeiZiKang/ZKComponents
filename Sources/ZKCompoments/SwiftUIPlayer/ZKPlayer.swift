// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 14.0, *)
public struct ZKPlayer: View {
    
    @ObservedObject public var viewModel: PlayerViewModel
    @State var showTimeCodeList: Bool
    public init(url: URL, timecodes: [Timecode], showTimeCodeList: Bool) {
        self.viewModel = PlayerViewModel(url: url, timecodes: timecodes)
        self.showTimeCodeList = showTimeCodeList
    }
    
  
    
    public var body: some View {
        VideoPlayerView(player: $viewModel.player, timecodes: viewModel.timecodes)
//            .onAppear(perform: {
//                viewModel.player.play()
//            })
//            .onDisappear(perform: {
//                viewModel.player.pause()
//            })
//        if showTimeCodeList {
//            TimecodeListView(player: viewModel.player, timecodes: viewModel.timecodes)
//        }
    }
}
