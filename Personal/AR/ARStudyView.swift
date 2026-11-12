//
//  ARStudyView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 5/24/25.
//

import ARKit
import SwiftUI

struct ARStudyView: View {
  @State private var configuration: ARWorldTrackingConfiguration?
  @State private var isShowingSceneKitContainer = false
  @State private var isShowingRealityKitContainer = false
  @State private var isShowingQuickLook = false
  
  var body: some View {
    List {
      Button {
        isShowingSceneKitContainer = true
      } label: {
        Text("SceneKit 활용")
      }
      
      Button {
        isShowingRealityKitContainer = true
      } label: {
        Text("RealityKit 활용")
      }
      
      Button {
        isShowingQuickLook = true
      } label: {
        Text("AR QuickLook")
      }
    }
    .onAppear {
      configuration = ARWorldTrackingConfiguration()
      configuration?.planeDetection = [.vertical, .horizontal]
    }
    .sheet(isPresented: $isShowingSceneKitContainer) {
      SceneKitContainer(configuration: configuration ?? ARWorldTrackingConfiguration())
    }
    .sheet(isPresented: $isShowingRealityKitContainer) {
      RealityKitContainer(configuration: configuration ?? ARWorldTrackingConfiguration())
    }
    .sheet(isPresented: $isShowingQuickLook) {
      ModelView() {
        print("dismiss")
        isShowingQuickLook = false
      }
    }
  }
}

#Preview {
  ARStudyView()
}
