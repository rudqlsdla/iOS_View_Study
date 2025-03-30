//
//  PersonalStudyTopic.swift.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 1/21/25.
//

import Foundation

enum PersonalStudyTopic: String, Hashable, CaseIterable {
  case navigationStack = "네비게이션 스택"
  case SMSCodeAutoCompleteView = "SMS 인증코드 자동 완성"
  case sendMessage = "메시지 전송하기"
  case motionShake = "흔들기 모션"
  case scenePhase = "SwiftUI에서 앱 생명주기 감지"
  case dynamicAppIcon = "앱 아이콘 동적 변경"
  case endian = "iOS의 Endian 확인"
}
