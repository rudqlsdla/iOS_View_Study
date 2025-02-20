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
            // 뷰 인스턴스 내부에서 Phase를 읽는 경우, 뷰가 포함된 씬의 Phase가 반영됨
            // 앱 인스턴스 내에서 Phase를 읽는 경우, 앱에 있는 모든 Scene의 Phase가 반영됨
            // 해당 코드는 뷰 인슽턴스 내부에서 Phase를 읽는 경우
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
