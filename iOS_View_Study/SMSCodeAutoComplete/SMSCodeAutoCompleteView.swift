//
//  SMSCodeAutoCompleteView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/21/25.
//

import SwiftUI

struct SMSCodeAutoCompleteView: View {
  @State private var typpedCode = ""
  
  var body: some View {
    ScrollView {
      VStack(spacing: 30) {
        Text(
      """
      문자를 받으면, 인증코드가 자동으로 입력됨
      이때, 가능한 문자 메시지의 형식은
      - 인증번호 + 조사 + 인증번호 텍스트
        ex) 0000은 인증번호
      - 인증번호 텍스트 + 조사 + 인증번호
        ex) 인증번호는 0000
      - 인증번호 + 특수문자 + 인증번호 텍스트
        ex) 0000 - 인증번호
      - 인증번호 텍스트+ 특수문자 + 인증번호
        ex) 인증번호: 0000
      (인증번호를 인증코드로 변경해도 정상 동작)
      자주 사용되는 형식
      [보내는 곳] 인증번호 [0000]을 화면에 입력해주세요
      
      영어로 보낼 때 인증번호 텍스트를 code로 변경 
      ex) code 0000, code: 0000, code is 0000
      """
        )
        
        TextField("인증코드를 입력해주세요.(TextField)", text: $typpedCode)
          .textContentType(.oneTimeCode)
          .padding()
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .fill(.clear)
              .strokeBorder(.black)
          }
          .padding(.horizontal, 30)
        
        Spacer()
      }
    }
  }
}

#Preview {
  SMSCodeAutoCompleteView()
}
