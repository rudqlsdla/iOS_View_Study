//
//  AppIconChangeView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/25/25.
//

import Foundation
import SwiftUI

struct AppIconChangeView: View {
  var body: some View {
    VStack(spacing: 20) {
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
        setIconWithoutAlert("secondaryIcon")
      } label: {
        Text("Alert 없이 앱 아이콘 변경하기")
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
}

private extension AppIconChangeView {
  // 기본 Alert 없이 Icon 변경하는 로직
  func setIconWithoutAlert(_ appIcon: String) {
    if UIApplication.shared.responds(to: #selector(getter: UIApplication.supportsAlternateIcons)) && UIApplication.shared.supportsAlternateIcons {
      typealias setAlternateIconName = @convention(c) (NSObject, Selector, NSString, @escaping (NSError) -> ()) -> ()
      let selectorString = "_setAlternateIconName:completionHandler:"
      let selector = NSSelectorFromString(selectorString)
      let imp = UIApplication.shared.method(for: selector)
      let method = unsafeBitCast(imp, to: setAlternateIconName.self)
      method(UIApplication.shared, selector, appIcon  as NSString, { _ in })
    }
  }
}

#Preview {
  AppIconChangeView()
}
