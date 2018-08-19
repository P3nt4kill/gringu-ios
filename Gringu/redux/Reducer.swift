//
//  Reducer.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import ReSwift

func mainReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()
  
  switch action {
  case let incoming as SelectedService:
    state.service = incoming.service
    state.journey = .selectedService
    
  case let incoming as PlacedOrder:
    state.order = incoming.order
    state.journey = .placedOrder
    
  case let incoming as AssistantFound:
    state.assistant = incoming.assistant
    state.journey = .waitingForAssistant
    
  case let incoming as ServiceStarted:
    state.startTime = incoming.startTime
    state.journey = .serviceInProgress
    
  case let incoming as ServiceEnded:
    state.endTime = incoming.endTime
    state.journey = .serviceEnded
    
  case _ as GoBack, _ as AssistantEvaluated:
    state.assistant = nil
    state.endTime = nil
    state.startTime = nil
    state.order = nil
    state.service = nil
    state.journey = .idle
    
  default: break
  }
  
  return state
}
