//
//  UniversalOverlayModifier.swift
//  UniversalOverlay
//
//  Created by Mohammed Rokon Uddin on 10/26/24.
//

import SwiftUI

@available(iOS 17.0, *)
public struct UniversalOverlayModifier<ViewContent: View>: ViewModifier {
  public var animation: Animation
  @Binding public var show: Bool
  @ViewBuilder public var viewContent: ViewContent

  @Environment(UniversalOverlayModel.self) private var model
  @State private var viewId: String?

    public func body(content: Content) -> some View {
    content
      .onChange(of: show) { oldValue, newValue in
        if newValue {
          addView()
        } else {
          removeView()
        }
      }
  }

  private func addView() {
    if model.window != nil && viewId == nil {
      viewId = UUID().uuidString
      withAnimation(animation) {
        model.views.append(.init(id: viewId!, view: AnyView(viewContent)))
      }
    }
  }

  private func removeView() {
    if let viewId {
      withAnimation(animation) {
        model.views.removeAll(where: { $0.id == viewId })
      }
      self.viewId = nil
    }
  }
}
