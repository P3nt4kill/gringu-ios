//
//  Reducer.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
func mainReducer(action: Action, state: AppState?) -> AppState {
  var state = state ?? AppState()
  
  switch action {
  case _ as CounterActionIncrease:
    state.counter += 1
  case _ as CounterActionDecrease:
    state.counter -= 1
  default:
    break
  }
  
  return state
}
