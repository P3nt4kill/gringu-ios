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
  
  func idleState(_ state: AppState) {
  }
  
  func selectedServiceState(_ state: AppState) {
    print("Service selected \(state.service)")
  }
  
  func placeOrderState(_ state: AppState) {
    
  }
  
  func serviceInProgressState(_ state: AppState) {
    
  }
  
  func serviceEndedState(_ state: AppState) {
    
  }
  
  func waitingForAssistantState(_ state: AppState) {
    
  }
}

extension GringuViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = AppState
  
  func newState(state: AppState) {
    switch state.journey {
    case .idle: idleState(state)
    case .selectedService: selectedServiceState(state)
    case .placedOrder: placeOrderState(state)
    case .serviceInProgress: serviceInProgressState(state)
    case .serviceEnded: serviceEndedState(state)
    case .waitingForAssistant: waitingForAssistantState(state)
    default: break
    }
  }
}
