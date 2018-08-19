//
//  ReviewOrderViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

class ReviewOrderViewController: UIViewController,
  IdealViewBoundsProvider,
  Appearable,
  Disappearable,
  StoreSubscriber {
  
  typealias StoreSubscriberStateType = AppState
  
  @IBOutlet weak var buttonConfirm: UIButton!
  @IBOutlet weak var quotePrice: UILabel!
  @IBOutlet weak var selectByTime: UIButton!
  @IBOutlet weak var selectByClicks: UIButton!
  @IBOutlet weak var buttonBack: UIButton!
  @IBOutlet weak var typeIcon: UIImageView!
  
  private var chargeType = ServiceChargeType.byMinutes
  
  @IBAction func actionConfirmOrder(_ sender: UIButton) {
    let order = GringuOrder(chargeType: chargeType)
    mainStore.dispatch(PlacedOrder(order: order))
  }
  
  @IBAction func actionGoBack(_ sender: UIButton) {
    mainStore.dispatch(GoBack())
  }
  
  @IBAction func actionSelectTime(_ sender: UIButton) {
    chargeType = .byMinutes
    selectByTime.backgroundColor = UIColor(rgb: 0x000000)
    selectByClicks.backgroundColor = UIColor(rgb: 0x071846)
  }
  
  @IBAction func actionSelectClicks(_ sender: UIButton) {
    chargeType = .byClicks
    selectByClicks.backgroundColor = UIColor(rgb: 0x000000)
    selectByTime.backgroundColor = UIColor(rgb: 0x071846)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }
  
  func idealViewBounds(_ parentBounds: CGRect) -> CGRect {
    var newRect = parentBounds.insetBy(dx: 16, dy: 0)
    newRect.size.height = 400
    return newRect
  }
  
  func appear(from parentBounds: CGRect, completion: @escaping () -> ()) {
    self.view.alpha = 0
    self.view.frame.origin.y = parentBounds.size.height
    
    UIView.animate(
      withDuration: ViewConfig.fadeInTime,
      animations: {
        self.view.alpha = 1
        self.view.frame.origin.y = parentBounds.size.height - self.view.frame.size.height
      },
      completion: { if $0 { completion() }})
  }
  
  func disappear(from parentBounds: CGRect, completion: @escaping () -> ()) {
    self.view.alpha = 1
    UIView.animate(
      withDuration: ViewConfig.fadeOutTime,
      animations: { self.view.alpha = 0 },
      completion: { if $0 { completion() }})
  }
  
  func newState(state: AppState) {
    guard let service = state.service else { return }
    
    switch service {
    case .pop: typeIcon.image = UIImage(named: "iphone")
               quotePrice.text = "R$ 8,59"
    case .x: typeIcon.image = UIImage(named: "cam")
              quotePrice.text = "R$ 12,12"
    case .pro: typeIcon.image = UIImage(named: "pro")
              quotePrice.text = "R$ 25,60"
    case .action: typeIcon.image = UIImage(named: "action")
              quotePrice.text = "R$ 30,10"
    case .translate: typeIcon.image = UIImage(named: "translate")
              quotePrice.text = "R$ 19,90"
    case .recharge: typeIcon.image = UIImage(named: "recharge")
              quotePrice.text = "R$ 5,90"
    case .guide: typeIcon.image = UIImage(named: "guide")
              quotePrice.text = "R$ 35,00"
    }
  }
}
