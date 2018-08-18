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

struct PlacedOrder: Action {
  let order: GringuOrder
}

struct AssistantFound: Action {}
struct 
