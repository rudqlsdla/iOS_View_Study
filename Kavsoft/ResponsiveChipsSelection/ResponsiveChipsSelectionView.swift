//
//  ResponsiveChipsSelectionView.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 3/12/25.
//

import SwiftUI

/// Sample Data
let tags: [String] = [
  "Swift", "SwiftUI", "UIKit", "AppKit", "iOS", "macOS", "tvOS", "watchOS"
]

struct ResponsiveChipsSelectionView: View {
  var body: some View {
      VStack {
        Text("iOS 16 이상(iPadOS, MacOS 지원)")
        /// Custom View가 들어가는 곳
        ChipsView(tags: tags) { tag, isSelected in
          ChipView(tag, isSelected: isSelected)
        } didChangeSelection: { selection in
          print(selection)
        }
        .padding(10)
        .background(.gray.opacity(0.1), in: .rect(cornerRadius: 20))
      }
      .padding()
  }
  
  @ViewBuilder
  func ChipView(_ tag: String, isSelected: Bool) -> some View {
    HStack(spacing: 10) {
      Text(tag)
        .font(.callout)
        .foregroundStyle(isSelected ? .white : Color.primary)
      
      if isSelected {
        Image(systemName: "checkmark.circle.fill")
          .foregroundStyle(.white)
      }
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 8)
    .background() {
      ZStack {
        Capsule()
          .fill(.background)
          .opacity(!isSelected ? 1 : 0)
        
        Capsule()
          .fill(.green.gradient)
          .opacity(isSelected ? 1 : 0)
      }
    }
  }
}

#Preview {
  ResponsiveChipsSelectionView()
}
