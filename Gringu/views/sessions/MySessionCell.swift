//
//  MySessionCell.swift
//  Gringu
//
//  Created by Thiago Ricieri on 19/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import UIKit
import SDWebImage

class MySessionCell: UITableViewCell {
  
  static let identifier = "MySessionCell"
  
  @IBOutlet weak var picture: UIImageView!
  @IBOutlet weak var label: UILabel!
  
  func configure(_ object: GringuSession) {
    
    label.text = object.name
    picture.sd_setImage(with: URL(string: object.photos.first!.url)!, completed: nil)
  }
}
