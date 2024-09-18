//
//  ContentView.swift
//  Demo
//
//  Created by 雷子康 on 2024/9/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZKPlayer(url: "爱的迫降", timecodes: [], showTimeCodeList: false)
    }
}

extension String {
    
    /// 从bundle中获取视频资源url
    func bundleUrl() -> URL {
        return Bundle.main.url(forResource: self, withExtension: "mp4")!
    }
}
#Preview {
    ContentView()
}
