//
//  MyPictureCell.swift
//  Gringu
//
//  Created by Thiago Ricieri on 19/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import UIKit
import SDWebImage

class MyPictureCell: UICollectionViewCell {
  
  static let identifier = "MyPictureCell"
  
  @IBOutlet weak var picture: UIImageView!
  
  func configure(_ object: GringuPhoto) {
    picture.sd_setImage(with: URL(string: object.url)!, completed: nil)
  }
}
