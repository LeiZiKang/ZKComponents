//
//  RootView.swift
//  UniversalOverlay
//
//  Created by Mohammed Rokon Uddin on 10/26/24.
//

import SwiftUI

@available(iOS 17.0, *)
public struct RootView<Content: View>: View {
  public var content: Content
  private var model = UniversalOverlayModel()

  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content()
  }

  public var body: some View {
    content
      .environment(model)
      .onAppear {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene), model.window == nil {
          let window = PassThroughWindow(windowScene: windowScene)
          window.isHidden = false
          window.isUserInteractionEnabled = true

          let rootViewController = UIHostingController(rootView: UniversalOverlayView().environment(model))
          rootViewController.view.backgroundColor = .clear
          window.rootViewController = rootViewController
          model.window = window
        }
      }
  }
}
