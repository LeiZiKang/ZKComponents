//
//  UniversalOverlayView.swift
//  UniversalOverlay
//
//  Created by Mohammed Rokon Uddin on 10/26/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct UniversalOverlayView: View {
  @Environment(UniversalOverlayModel.self) private var model
  var body: some View {
    ZStack {
      ForEach(model.views) {
        $0.view
      }
    }
  }
}
