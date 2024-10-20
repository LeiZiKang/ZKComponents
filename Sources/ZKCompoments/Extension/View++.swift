//
//  File.swift
//  ZKCompoments
//
//  Created by 雷子康 on 2024/10/20.
//

import Foundation
import SwiftUI

/// 透明色的背景视图
public struct BackgroundClearView: UIViewRepresentable {
    
    public init () {
        
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}
