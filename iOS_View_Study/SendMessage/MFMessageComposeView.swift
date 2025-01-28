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
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {

  }
}

#Preview {
  MFMessageComposeView()
}
