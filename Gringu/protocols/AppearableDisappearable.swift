//
//  AnimatedTransitionProvider.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import UIKit

protocol Appearable {
  func appear(from parentBounds: CGRect, completion: @escaping () -> ())
}
protocol Disappearable {
  func disappear(from parentBounds: CGRect, completion: @escaping () -> ())
}
