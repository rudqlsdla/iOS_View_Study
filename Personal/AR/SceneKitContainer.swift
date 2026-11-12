//
//  SceneKitContainer.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 5/24/25.
//

import SwiftUI
import ARKit

struct SceneKitContainer: UIViewRepresentable {
  let configuration: ARConfiguration
  
  func makeUIView(context: Context) -> ARSCNView {
    // ARSCNView 생성
    let sceneView = ARSCNView()
    sceneView.session.run(configuration)
    
    // SceneKit 장면 생성
    let scene = SCNScene()
    sceneView.scene = scene
    
    // 노드를 장면에 추가
    scene.rootNode.addChildNode(makeTextNode())
//    scene.rootNode.addChildNode(makeBoxNode())
    
//    let light = SCNLight()
//    light.type = .omni
//    let lightNode = SCNNode()
//    lightNode.light = light
//    lightNode.position = SCNVector3(0, 2, 2)
//    scene.rootNode.addChildNode(lightNode)
    
    return sceneView
  }
  
  func updateUIView(_ uiView: ARSCNView, context: Context) {}
  
  /// 박스 노드 생성
  private func makeBoxNode() -> SCNNode {
    let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
    box.firstMaterial?.diffuse.contents = UIColor.blue
    let boxNode = SCNNode(geometry: box)
    boxNode.position = SCNVector3(0, 0, -0.5)
    boxNode.rotation = SCNVector4(0, 1, 0, Float.pi / 4) // Y축으로 45도 회전
    
    return boxNode
  }
  
  /// 텍스트 노드 생성
  private func makeTextNode() -> SCNNode {
    let textGeometry = SCNText(string: "CMC iOS", extrusionDepth: 1.0)
    textGeometry.firstMaterial?.diffuse.contents = UIColor.systemBlue
    textGeometry.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    textGeometry.flatness = 0.1 // 더 부드러운 곡선을 위해
    
    let textNode = SCNNode(geometry: textGeometry)
    textNode.position = SCNVector3(0, 0, -0.5)
    textNode.scale = SCNVector3(0.005, 0.005, 0.005)
    
    return textNode
  }
}
