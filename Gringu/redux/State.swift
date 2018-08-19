//
//  State.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
  
  var journey = GringuJourneyMoment.initial
  var service: GringuService?
  var order: GringuOrder?
  var assistant: GringuAssistant?
  var startTime: Date?
  var endTime: Date?
}

enum GringuJourneyMoment {
  case initial
  case idle
  case selectedService
  case placedOrder
  case waitingForAssistant
  case serviceInProgress
  case serviceEnded
}
