//
//  KavsoftStudyView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 3/11/25.
//

import SwiftUI

struct KavsoftStudyView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(KavsoftStudyTopic.allCases, id: \.self) { topic in
          NavigationLink(topic.rawValue, value: topic)
        }
      }
      .navigationDestination(for: KavsoftStudyTopic.self) { topic in
        setStudyView(with: topic)
      }
      .navigationTitle("Kavsoft Clone Study")
    }
  }
}

private extension KavsoftStudyView {
  @ViewBuilder
  func setStudyView(with topic: KavsoftStudyTopic) -> some View {
    switch topic {
    case .test:
      Text("test")
    }
  }
}

#Preview {
  KavsoftStudyView()
}
