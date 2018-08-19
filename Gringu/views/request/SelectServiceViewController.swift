//
//  SelectServiceViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class SelectServiceViewController: UIViewController {
  
  @IBOutlet weak var buttonPop: UIButton!
  @IBOutlet weak var buttonX: UIButton!
  @IBOutlet weak var buttonPro: UIButton!
  @IBOutlet weak var buttonAction: UIButton!
  
  @IBAction func actionSelectService(_ sender: Any) {
    switch (sender as! UIButton) {
    case buttonPop:    mainStore.dispatch(SelectedService(service: .pop))
    case buttonX:      mainStore.dispatch(SelectedService(service: .x))
    case buttonPro:    mainStore.dispatch(SelectedService(service: .pro))
    case buttonAction: mainStore.dispatch(SelectedService(service: .action))
    default: break
    }
  }
}
