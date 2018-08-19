//
//  PlaceOrderViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class PlaceOrderViewController: UIViewController, IdealViewBoundsProvider {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let assistant = GringuAssistant()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      mainStore.dispatch(AssistantFound(assistant: assistant))
    }
  }
  
  func idealViewBounds(_ parentBounds: CGRect) -> CGRect {
    return parentBounds
  }
}
