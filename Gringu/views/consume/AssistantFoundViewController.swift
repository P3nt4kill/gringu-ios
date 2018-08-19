//
//  AssistantFoundViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class AssistantFoundViewController: UIViewController,
  Appearable,
  Disappearable  {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      mainStore.dispatch(ServiceStarted(startTime: Date()))
    }
  }
  
  func appear(from parentBounds: CGRect, completion: @escaping () -> ()) {
    self.view.alpha = 0
    UIView.animate(
      withDuration: ViewConfig.fadeInTimeFast,
      animations: { self.view.alpha = 1 },
      completion: { if $0 { completion() }})
  }
  
  func disappear(from parentBounds: CGRect, completion: @escaping () -> ()) {
    self.view.alpha = 1
    UIView.animate(
      withDuration: ViewConfig.fadeOutTime,
      animations: { self.view.alpha = 0 },
      completion: { if $0 { completion() }})
  }
}
