//
//  ContentView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/21/25.
//

import SwiftUI

struct ContentView: View {
  @Binding var scenePhaseType: ScenePhase
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(StudyTopic.allCases, id: \.self) { topic in
          NavigationLink(topic.rawValue, value: topic)
        }
      }
      .navigationDestination(for: StudyTopic.self) { topic in
        setStudyView(with: topic)
      }
      .navigationTitle("iOS Study")
    }
    .overlay {
      if scenePhaseType != .active {
        ScreenProtectionView()
      }
    }
  }
}

private extension ContentView {
  @ViewBuilder
  func setStudyView(with topic: StudyTopic) -> some View {
    switch topic {
    case .navigationStack:
      NavigationStackView()
    case .SMSCodeAutoCompleteView:
      SMSCodeAutoCompleteView()
    case .sendMessage:
      SendMessageView()
    case .motionShake:
      MotionShakeView()
    }
  }
  
  struct ScreenProtectionView: View {
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
  ContentView(scenePhaseType: .constant(.active))
}
