//
//  RoundButton.swift
//  Gringu
//
//  Created by Thiago Ricieri on 19/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    clipsToBounds = true
    layer.cornerRadius = self.bounds.width/2
  }
}

class RoundedImage: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    clipsToBounds = true
    layer.cornerRadius = self.bounds.width/2
  }
}

class RoundedElevatedImage: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    clipsToBounds = true
    layer.cornerRadius = self.bounds.width/2
    applyDropShadow(layer, bounds)
  }
}
