//
//  ContentView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/21/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Tab("Personal", systemImage: "person.fill.questionmark") {
        PersonalStudyView()
      }
      
      Tab("Kavsoft", systemImage: "document.on.document.fill") {
        KavsoftStudyView()
      }
    }
  }
}

#Preview {
  ContentView()
}
