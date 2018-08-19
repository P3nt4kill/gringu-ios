//
//  AssistantFoundViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class AssistantFoundViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      mainStore.dispatch(ServiceStarted(startTime: Date()))
    }
  }
}
