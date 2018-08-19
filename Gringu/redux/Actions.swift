//
//  Actions.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import ReSwift

struct SelectedService: Action {
  let service: GringuService
}

struct GoBack: Action {}

struct PlacedOrder: Action {
  let order: GringuOrder
}

struct AssistantFound: Action {
  let assistant: GringuAssistant
}

struct ServiceStarted: Action {
  let startTime: Date
}

struct ServiceEnded: Action {
  let endTime: Date
}

struct AssistantEvaluated: Action {
  let score: Int
}
