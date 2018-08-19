//
//  MyPictureCell.swift
//  Gringu
//
//  Created by Thiago Ricieri on 19/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import UIKit
import AlamofireImage

class MyPictureCell: UICollectionViewCell {
  
  static let identifier = "MyPictureCell"
  
  @IBOutlet weak var picture: UIImageView!
  
  var receipt: RequestReceipt?
  
  func configure(_ object: GringuPhoto) {
    let downloader = ImageDownloader()
    let urlRequest = URLRequest(url: URL(string: "https://httpbin.org/image/jpeg")!)
    
    if receipt != nil {
      downloader.cancelRequest(with: receipt!)
    }
    
    receipt = downloader.download(urlRequest) { response in
      if let image = response.result.value {
        self.picture.image = image
      }
    }
  }
}
