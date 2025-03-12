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
  @State private var recipients = [String]()
  @State private var typpedMessage = ""
  @State private var typpedRecipient = ""
  
  var body: some View {
    VStack {
      TextField("보내고 싶은 메시지 내용을 입력해주세요.", text: $typpedMessage)
        .padding()
        .overlay {
          RoundedRectangle(cornerRadius: 12)
            .fill(.clear)
            .strokeBorder(.black)
        }
      
      HStack {
        TextField("메시지를 보낼 번호를 입력해주세요.", text: $typpedRecipient)
          .padding()
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .fill(.clear)
              .strokeBorder(.black)
          }
          .keyboardType(.numberPad)
        
        Button {
          addRecipient()
        } label: {
          Text("추가")
        }
        .buttonStyle(.bordered)
      }
      
      ScrollView {
        VStack {
          Text("메시지를 보낼 번호 리스트")
          ForEach(recipients, id: \.self) { recipient in
            Text(recipient)
          }
        }
        .frame(maxWidth: .infinity)
      }
      .frame(height: 100)
      .padding()
      .background(.gray)
      .clipShape(.rect(cornerRadius: 8))
      
      Button {
        showMessageView()
      } label: {
        Text("메시지 전송 버튼")
      }
      .sheet(isPresented: $isMessageViewPresented) {
        MFMessageComposeView(
          recipients: recipients,
          message: typpedMessage
        )
      }
    }
    .padding()
  }
}

private extension SendMessageView {
  func addRecipient() {
    if !typpedRecipient.isEmpty {
      recipients.append(typpedRecipient)
      typpedRecipient = ""
    }
  }
  
  func showMessageView() {
    if MFMessageComposeViewController.canSendText() { // 메시지를 보낼 수 있는지 확인
      isMessageViewPresented = true
    }
  }
}

#Preview {
  SendMessageView()
}
