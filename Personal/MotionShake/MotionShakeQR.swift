//
//  MotionShakeQR.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/10/25.
//

import SwiftUI

struct MotionShakeQR: View {
  @State private var isQRViewPresented = false
  
  var body: some View {
    Text("흔들어주세요!")
      .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
        isQRViewPresented = true
      }
      .sheet(isPresented: $isQRViewPresented) {
        Image("ShakeQR")
          .resizable()
          .scaledToFit()
          .padding()
      }
  }
}

extension NSNotification.Name {
  public static let deviceDidShakeNotification = NSNotification.Name("DeviceDidShakeNotification")
}

extension UIWindow {
  open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    super.motionEnded(motion, with: event)
    NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
  }
}

#Preview {
  MotionShakeQR()
}
