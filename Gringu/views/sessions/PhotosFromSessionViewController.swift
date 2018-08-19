//
//  PhotosFromSessionViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit

class PhotosFromSessionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

  var photos: [GringuPhoto]!
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPictureCell.identifier, for: indexPath) as! MyPictureCell
    cell.configure(photos[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
}
