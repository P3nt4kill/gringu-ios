//
//  ReviewOrderViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class ReviewOrderViewController: UIViewController,
  IdealViewBoundsProvider,
  Appearable,
  Disappearable {
  
  @IBOutlet weak var buttonConfirm: UIButton!
  
  @IBAction func actionConfirmOrder(_ sender: UIButton) {
    let order = GringuOrder(chargeType: .byClicks, amount: 10) // TODO
    mainStore.dispatch(PlacedOrder(order: order))
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
      withDuration: 0.5,
      animations: {
        self.view.alpha = 1
        self.view.frame.origin.y = parentBounds.size.height - self.view.frame.size.height
      },
      completion: { finished in
        if finished { completion() }
      })
  }
  
  func disappear(from parentBounds: CGRect, completion: @escaping () -> ()) {
    self.view.alpha = 1
    UIView.animate(
      withDuration: 0.5,
      animations: {
        self.view.alpha = 0
      },
      completion: { finished in
        if finished { completion() }
    })
  }
}
