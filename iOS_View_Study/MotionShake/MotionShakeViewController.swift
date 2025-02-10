//
//  MotionShakeViewController.swift
//  iOS_View_Study
//
//  Created by 임경빈 on 2/10/25.
//

import UIKit

class MotionShakeViewController: UIViewController {
  private lazy var mainLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func loadView() {
    setMessage()
  }
  
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    print("모션 시작")
    if motion == .motionShake {
      // 흔들면서 시작이 탈 때, 타이밍 맞게 멈추면 종료를 안탐
      changeLabel(with: .began)
    }
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    // 흔들면서 시작이 탈 때, 타이밍 맞게 멈추면 종료를 안탐
    changeLabel(with: .ended)
    print("모션 종료")
  }
  
  override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    changeLabel(with: .cancelled)
    print("모션 취소")
  }
  
  private func changeLabel(with type: MotionShakeType) {
    mainLabel.text = type.message
    mainLabel.textColor = type.color
  }
  
  private func setMessage() {
    mainLabel.text = "모션에 따라 변경되는 문구"
    self.view.addSubview(mainLabel)
    mainLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      mainLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      mainLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 20),
      mainLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: -20)
    ])
  }
}
