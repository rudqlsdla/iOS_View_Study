//
//  SendMessageView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/28/25.
//

import MessageUI
import SwiftUI

struct SendMessageView: View {
  @State private var isMessageViewPresented = false
  
  var body: some View {
    Button {
      showMessageView()
    } label: {
      Text("메시지 전송 버튼")
    }
    .sheet(isPresented: $isMessageViewPresented) {
      MFMessageComposeView()
    }
  }
}

private extension SendMessageView {
  func showMessageView() {
    if MFMessageComposeViewController.canSendText() { // 메시지를 보낼 수 있는지 확인
      isMessageViewPresented = true
    }
  }
}

#Preview {
  SendMessageView()
}
