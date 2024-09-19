//
//  ContentView.swift
//  Demo
//
//  Created by 雷子康 on 2024/9/20.
//

import SwiftUI
import ZKCompoments

struct ContentView: View {
    var body: some View {
        NavigationStack {
     
            NavigationLink("Color", destination: ColorView())
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
