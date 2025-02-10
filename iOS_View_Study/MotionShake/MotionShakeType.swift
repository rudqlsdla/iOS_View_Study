//
//  MotionShakeType.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/10/25.
//

import UIKit

enum MotionShakeType {
  case began
  case ended
  case cancelled
}

extension MotionShakeType {
  var color: UIColor {
    switch self {
    case .began:
        .blue
    case .ended:
        .red
    case .cancelled:
        .green
    }
  }
  
  var message: String {
    switch self {
    case .began:
      "흔들기 모션 시작"
    case .ended:
      "흔들기 모션 종료"
    case .cancelled:
      "흔들기 모션 취소"
    }
  }
}
