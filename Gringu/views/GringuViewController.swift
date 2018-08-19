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
  @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
  
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
    hideContainerView({ _ in })
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
    displayContainerView({ _ in })
  }
}

// MARK: -
extension GringuViewController {
  private func hideContainerView(_ completed: @escaping (Bool) -> Void) {
    UIView.animate(
      withDuration: 0.7,
      animations: {
        self.containerView.alpha = 0.4
        self.bottomConstraint.constant = -200
        self.view.layoutIfNeeded()
      },
      completion: completed)
  }
  private func displayContainerView(_ completed: @escaping (Bool) -> Void) {
    UIView.animate(
      withDuration: 0.5,
      animations: {
        self.containerView.alpha = 1
        self.bottomConstraint.constant = 20
      },
      completion: completed)
  }
}

// MARK: -
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
    
    if let vc = content as? IdealViewBoundsProvider {
      content.view.frame = vc.idealViewBounds(self.view.frame)
    }
    if let vc = content as? Appearable {
      vc.appear(from: self.view.frame, completion: { } )
    }
  }
  
  func hideContentController(content: UIViewController) {
    if let vc = content as? Disappearable {
      vc.disappear(from: self.view.frame) {
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
      }
    }
    else {
      content.view.removeFromSuperview()
      content.removeFromParentViewController()
    }
  }
}
