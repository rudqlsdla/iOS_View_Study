//
//  ScenePhaseView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/20/25.
//

import SwiftUI

struct ScenePhaseView: View {
  @Environment(\.scenePhase) var scenePhase
  @State private var isScenePhaseSheetPresented = false
  @State private var scenePhaseType: ScenePhase = .active
  
  var body: some View {
    Button {
      isScenePhaseSheetPresented = true
    } label: {
      Text("ScenePhase를 감지하는 시트 열기")
    }
    .sheet(isPresented: $isScenePhaseSheetPresented) {
      VStack {
        Text("ScenePhase Observing View")
          .font(.title)
          .onChange(of: scenePhase) {
            scenePhaseType = scenePhase
            switch scenePhase {
            case .active:
              print("active")
            case .inactive:
              print("inactive")
            case .background:
              print("background")
            default:
              print("default - \(scenePhase)")
            }
          }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay {
        if scenePhaseType != .active {
          ScreenSaverView()
        }
      }
    }
  }
  
  private struct ScreenSaverView: View {
    var body: some View {
      ZStack {
        Color.black
        Image(systemName: "hand.raised.slash.fill")
          .scaleEffect(5)
          .foregroundStyle(.white)
      }
      .ignoresSafeArea()
    }
  }
}

#Preview {
  ScenePhaseView()
}
