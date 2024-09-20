//
//  ColorView.swift
//  Demo
//
//  Created by 雷子康 on 2024/9/20.
//

import SwiftUI
import ZKCompoments

struct ColorView: View {
    var body: some View {
        List {
            // swiftUI
            HStack {
                Text("#3498dbff")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Color(hexString: "#3498dbff")
                    .clipShape(.circle)
                    .padding()
                
            }
            // UIKit
            HStack {
                Text("#4B0082")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                DemoColorView()
                    .clipShape(.circle)
                    .padding()
            }
        }
      
        
    }
}

struct DemoColorView: UIViewRepresentable {
    typealias UIViewType = DemoColor
    
    func makeUIView(context: Context) -> DemoColor {
        return DemoColor()
    }
    
    func updateUIView(_ uiView: DemoColor, context: Context) {
        
    }
    
}

class DemoColor: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(hexString: "#4B0082")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ColorView()
}
