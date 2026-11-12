//
//  RealityKitContainer.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 5/24/25.
//

import SwiftUI
import RealityKit
import ARKit

struct RealityKitContainer: UIViewRepresentable {
  let configuration: ARConfiguration
  
  func makeUIView(context: Context) -> ARView {
    let arView = ARView(frame: .zero)
    arView.session.run(configuration)
    
    // 간단한 박스 엔티티 생성
    let boxMesh = MeshResource.generateBox(size: 0.1)
    let boxMaterial = SimpleMaterial(color: .blue, isMetallic: false) // PBR
    let boxEntity = ModelEntity(mesh: boxMesh, materials: [boxMaterial])
    boxEntity.generateCollisionShapes(recursive: true)
    
    // 위치 설정
    boxEntity.position = SIMD3(x: 0, y: 0, z: -0.5) // 카메라 앞 0.5m
    
    // 회전 예시
    boxEntity.orientation = simd_quatf(angle: .pi/4, axis: [0, 1, 0])
    
    // Anchor에 붙여서 장면에 추가
    let anchor = AnchorEntity(world: SIMD3(x: 0, y: 0, z: -0.5))
    anchor.addChild(boxEntity)
    arView.scene.anchors.append(anchor)
    
    return arView
  }
  
  func updateUIView(_ uiView: ARView, context: Context) {}
}
