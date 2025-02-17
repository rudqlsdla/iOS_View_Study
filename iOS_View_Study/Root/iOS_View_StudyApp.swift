//
//  iOS_View_StudyApp.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/21/25.
//

import SwiftUI

@main
struct iOS_View_StudyApp: App {
  @Environment(\.scenePhase) var scenePhase
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onChange(of: scenePhase) {
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
  }
}
