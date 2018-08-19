//
//  GringuViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

class GringuViewController: UIViewController {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var containerHeight: NSLayoutConstraint!
  
  private var activeViewController: UIViewController!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }
}

extension GringuViewController {
  
  func selectedServiceState(_ state: AppState) {
    let nextViewController = createViewController("reviewOrder")
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func placeOrderState(_ state: AppState) {
    let nextViewController = createViewController("placeOrder")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func waitingForAssistantState(_ state: AppState) {
    let nextViewController = createViewController("assistantFound")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func serviceInProgressState(_ state: AppState) {
    let nextViewController = createViewController("serviceInProgress")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func serviceEndedState(_ state: AppState) {
    let nextViewController = createViewController("rateAssistant")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func idleState(_ state: AppState) {
    hideContentController(content: activeViewController)
  }
}

extension GringuViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = AppState
  
  func newState(state: AppState) {
    switch state.journey {
    case .idle: idleState(state)
    case .selectedService: selectedServiceState(state)
    case .placedOrder: placeOrderState(state)
    case .waitingForAssistant: waitingForAssistantState(state)
    case .serviceInProgress: serviceInProgressState(state)
    case .serviceEnded: serviceEndedState(state)
    default: break
    }
  }
}

extension GringuViewController {
  func displayContentController(content: UIViewController) {
    addChildViewController(content)
    self.view.addSubview(content.view)
  }
  
  func hideContentController(content: UIViewController) {
    content.view.removeFromSuperview()
    content.removeFromParentViewController()
  }
}
