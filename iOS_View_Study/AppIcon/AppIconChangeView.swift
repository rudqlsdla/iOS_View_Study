//
//  AppIconChangeView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/25/25.
//

import SwiftUI

struct AppIconChangeView: View {
  var body: some View {
    Button {
      UIApplication.shared.setAlternateIconName("secondaryIcon") { error in
        if let error = error {
          print(error.localizedDescription)
        }
      }
    } label: {
      Text("앱 아이콘 변경하기")
    }
    
    Button {
      // 기존 앱 아이콘으로 변경하기 위해선 alternateIconName에 nil을 전달하면 됨
      UIApplication.shared.setAlternateIconName(nil) { error in
        if let error = error {
          print(error.localizedDescription)
        }
      }
    } label: {
      Text("기존 앱 아이콘으로 변경하기")
    }
  }
}

#Preview {
  AppIconChangeView()
}
