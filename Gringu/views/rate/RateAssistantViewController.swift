//
//  RateAssistantViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

class RateAssistantViewController: UIViewController,
  Appearable,
  Disappearable,
  StoreSubscriber {
  
  typealias StoreSubscriberStateType = AppState
  
  @IBOutlet weak var typeIcon: RoundedElevatedImage!
  @IBOutlet weak var buttonRate: UIButton!
  
  @IBAction func actionRate(_ sender: UIButton) {
    mainStore.dispatch(AssistantEvaluated(score: 5)) // TODO
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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }
  
  func newState(state: AppState) {
    guard let service = state.service else { return }
    
    switch service {
    case .pop: typeIcon.image = UIImage(named: "iphone")
    case .x: typeIcon.image = UIImage(named: "cam")
    case .pro: typeIcon.image = UIImage(named: "pro")
    case .action: typeIcon.image = UIImage(named: "action")
    case .translate: typeIcon.image = UIImage(named: "translate")
    case .recharge: typeIcon.image = UIImage(named: "recharge")
    case .guide: typeIcon.image = UIImage(named: "guide")
    }
  }
}
