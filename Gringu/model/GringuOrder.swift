//
//  GringuOrder.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation

struct GringuOrder: BaseModel {
  let chargeType: ServiceChargeType
  let amount: Int
  let payment: String = "Visa" // TODO
}

enum ServiceChargeType {
  case byMinutes
  case byClicks
}
