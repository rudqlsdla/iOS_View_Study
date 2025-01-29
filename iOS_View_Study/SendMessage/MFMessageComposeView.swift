//
//  MFMessageComposeView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/28/25.
//

import MessageUI
import SwiftUI

struct MFMessageComposeView: UIViewControllerRepresentable {
  typealias UIViewControllerType = MFMessageComposeViewController
  
  func makeUIViewController(context: Context) -> MFMessageComposeViewController {
    let viewController = MFMessageComposeViewController()
    viewController.recipients = ["메시지를 받을 사람"]
    viewController.body = "메시지를 보낼 내용이 담기는 body"
    viewController.messageComposeDelegate = context.coordinator
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }
}

class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
  var parent: MFMessageComposeView
  
  init(_ parent: MFMessageComposeView) {
    self.parent = parent
  }
  
  func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    print(result)
    switch result {
    case .cancelled:
      print("메시지 전송 취소")
    case .sent:
      print("메시지 전송 성공")
    case .failed:
      print("메시지 전송 실패")
    @unknown default:
      break
    }
    controller.dismiss(animated: true, completion: nil)
  }
}

#Preview {
  MFMessageComposeView()
}
