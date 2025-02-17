//
//  MotionShakeView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/10/25.
//

import SwiftUI

struct MotionShakeView: View {
  var body: some View {
    VStack {
      MotionShakeWrapper()
        .padding()
      
      NavigationLink("활용 사례", destination: MotionShakeQR())
    }
  }
}

struct MotionShakeWrapper: UIViewControllerRepresentable {
  
  func makeUIViewController(context: Context) -> MotionShakeViewController {
    return MotionShakeViewController()
  }
  
  func updateUIViewController(_ uiViewController: MotionShakeViewController, context: Context) {
    
  }
}

#Preview {
  MotionShakeView()
}
