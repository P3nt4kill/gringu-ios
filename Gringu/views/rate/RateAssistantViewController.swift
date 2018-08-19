//
//  RateAssistantViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class RateAssistantViewController: UIViewController {
  
  @IBOutlet weak var buttonRate: UIButton!
  
  @IBAction func actionRate(_ sender: UIButton) {
    mainStore.dispatch(AssistantEvaluated(score: 5)) // TODO
  }
  
  func idealViewBounds(_ parentBounds: CGRect) -> CGRect {
    return parentBounds
  }
}
