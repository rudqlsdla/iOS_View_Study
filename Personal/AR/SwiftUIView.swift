//
//  SwiftUIView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 5/24/25.
//

import QuickLook
import SwiftUI

struct ModelView: View {
  let endCaptureCallback: () -> Void
  
  var body: some View {
    if let usdzURL = Bundle.main.url(forResource: "toy_drummer_idle", withExtension: "usdz") {
      ARQuickLookController(modelFile: usdzURL, endCaptureCallback: endCaptureCallback)
    } else {
        Text("Failed to load model file.")
    }
  }
}

private struct ARQuickLookController: UIViewControllerRepresentable {
  let modelFile: URL
  let endCaptureCallback: () -> Void
  
  func makeUIViewController(context: Context) -> QLPreviewControllerWrapper {
    let controller = QLPreviewControllerWrapper()
    controller.qlvc.dataSource = context.coordinator
    controller.qlvc.delegate = context.coordinator
    return controller
  }
  
  func updateUIViewController(_ uiViewController: QLPreviewControllerWrapper, context: Context) {}
  
  func makeCoordinator() -> ARQuickLookController.Coordinator {
    return Coordinator(parent: self)
  }
  
  class Coordinator: NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    let parent: ARQuickLookController
    
    init(parent inParent: ARQuickLookController) {
      parent = inParent
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
      return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
      return parent.modelFile as QLPreviewItem
    }
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
      print("Exiting ARQL ...")
      parent.endCaptureCallback()
    }
  }
}

private class QLPreviewControllerWrapper: UIViewController {
  let qlvc = QLPreviewController()
  var qlPresented = false
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if !qlPresented {
      present(qlvc, animated: false, completion: nil)
      qlPresented = true
    }
  }
}
