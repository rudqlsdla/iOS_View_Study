//
//  EndianCheckView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 3/20/25.
//

import SwiftUI

struct EndianCheckView: View {
  @State private var isChecked = false
    var body: some View {
      Button {
        isChecked = true
      } label: {
        Text("확인하기")
      }
      
      if isChecked {
        Text(EndiannessChecker.checkEndianness())
      }
    }
}

#Preview {
    EndianCheckView()
}
