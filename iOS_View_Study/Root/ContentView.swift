//
//  ContentView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/21/25.
//

import SwiftUI

struct ContentView: View {
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
  }
}

private extension ContentView {
  @ViewBuilder
  func setStudyView(with topic: StudyTopic) -> some View {
    switch topic {
    case .navigationStack:
      NavigationStackView()
    }
  }
}

#Preview {
  ContentView()
}
