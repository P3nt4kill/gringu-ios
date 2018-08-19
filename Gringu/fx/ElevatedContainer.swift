//
//  ElevatedContainer.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

func applyDropShadow(_ layer: CALayer, _ bounds: CGRect) {
  let shadowPath = UIBezierPath(rect: bounds)
  layer.masksToBounds = false
  layer.shadowColor = UIColor.black.cgColor
  layer.shadowOffset = CGSize(width: 0.0, height: 9.0)
  layer.shadowOpacity = 0.4
  layer.shadowPath = shadowPath.cgPath
}

class ElevatedContainer: UIView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    applyDropShadow(layer, bounds)
  }
}

class ElevatedImage: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    applyDropShadow(layer, bounds)
  }
}

class ElevatedButton: UIButton {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    applyDropShadow(layer, bounds)
  }
}
