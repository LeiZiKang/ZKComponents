//
//  UniversalOverlay.swift
//  UniversalOverlay
//
//  Created by Levi on 2024/10/29.
// 灵感来源：https://www.youtube.com/watch?v=B8JGLwg_yxg

import SwiftUI
@available(iOS 17.0, *)
extension View {
    @ViewBuilder
   public func univeralOverlay<Content: View>(animation: Animation = .snappy, show: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .modifier(UniversalOverlayModifier(animation: animation, show: show, viewContent: content))
    }
}

@available(iOS 17.0, *)
public struct RootView<Content: View>: View {
    var content: Content
  public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    private var properties = UniversalOverlayProperties()
    public var body: some View {
        content
            .environment(self.properties)
            .onAppear {
                if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene), properties.window == nil {
                    let window = PassThroughWindow(windowScene: windowScene)
                    window.isHidden = false
                    window.isUserInteractionEnabled = true
                    let rootViewController = UIHostingController(rootView: UniversalOverlayViews().environment(properties))
                    rootViewController.view.backgroundColor = .clear
                    window.rootViewController = rootViewController
                    properties.window = window
                }
            }
    }
}

@available(iOS 17.0, *)
@Observable
class UniversalOverlayProperties {
    var window: UIWindow?
    var views: [OverlayView] = []
    
    struct OverlayView: Identifiable {
        var id: String = UUID().uuidString
        var view: AnyView
    }
}


@available(iOS 17.0, *)
fileprivate struct UniversalOverlayModifier<ViewContent: View>: ViewModifier {
    var animation: Animation
    @Binding var show: Bool
    @ViewBuilder var viewContent: ViewContent
    
    @Environment(UniversalOverlayProperties.self) private var properties
    @State private var viewID: String?
    
    func body(content: Content) -> some View {
        content
            .onChange(of: show) { oldValue, newValue in
                if newValue {
                    addView()
                } else {
                    removeView()
                }
            }
    }
    
   private  func addView() {
       if properties.window != nil && viewID == nil {
           viewID = UUID().uuidString
           guard let viewID else { return }
           
           withAnimation(animation) {
               properties.views.append(.init(id: viewID, view: .init(viewContent)))
           }
       }
    }
    
    private func removeView() {
        if let viewID {
            withAnimation(animation) {
                properties.views.removeAll(where: { $0.id == viewID })
            }
        }
    }
}
@available(iOS 17.0, *)
fileprivate struct UniversalOverlayViews: View {
    @Environment(UniversalOverlayProperties.self) private var properites
    var body: some View {
        ZStack {
            ForEach(self.properites.views) {
                $0.view
            }
        }
    }
}
@available(iOS 17.0, *)
fileprivate class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let hitView = super.hitTest(point, with: event), let rootView = rootViewController?.view else { return nil}
        if #available(iOS 18, *) {
            for subview in rootView.subviews.reversed() {
                let pointInSubView = subview.convert(point, to: rootView)
                if subview.hitTest(pointInSubView, with: event) == subview {
                    return hitView
                }
            }
            return nil
        } else {
            return hitView == rootView ? nil : hitView
        }
    }
}





//#Preview(body: {
//    RootView {
//        ContentView()
//    }
//})
