//
//  UniversalOverlayModel.swift
//  UniversalOverlay
//
//  Created by Mohammed Rokon Uddin on 10/26/24.
//

import SwiftUI

@available(iOS 17.0, *)
@Observable
class UniversalOverlayModel {
  var window: UIWindow?
  var views: [OverlayView] = []

  struct OverlayView: Identifiable {
    var id = UUID().uuidString
    var view: AnyView
  }
}
