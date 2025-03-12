//
//  PersonalStudyView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 3/11/25.
//

import SwiftUI

struct PersonalStudyView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(PersonalStudyTopic.allCases, id: \.self) { topic in
          NavigationLink(topic.rawValue, value: topic)
        }
      }
      .navigationDestination(for: PersonalStudyTopic.self) { topic in
        setStudyView(with: topic)
      }
      .navigationTitle("Personal iOS Study")
    }
  }
}

private extension PersonalStudyView {
  @ViewBuilder
  func setStudyView(with topic: PersonalStudyTopic) -> some View {
    switch topic {
    case .navigationStack:
      NavigationStackView()
    case .SMSCodeAutoCompleteView:
      SMSCodeAutoCompleteView()
    case .sendMessage:
      SendMessageView()
    case .motionShake:
      MotionShakeView()
    case .scenePhase:
      ScenePhaseView()
    case .dynamicAppIcon:
      AppIconChangeView()
    }
  }
}

#Preview {
  PersonalStudyView()
}
