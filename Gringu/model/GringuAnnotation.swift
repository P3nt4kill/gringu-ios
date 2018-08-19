//
//  GringuAnnotation.swift
//  Gringu
//
//  Created by Thiago Ricieri on 19/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import UIKit
import MapKit

class GringuAnnotation: NSObject, MKAnnotation {
  
  static let identifier = "Gringu"
  
  var coordinate: CLLocationCoordinate2D
  var title: String?
  
  init(_ latitude:CLLocationDegrees, _ longitude: CLLocationDegrees, title: String){
    self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    self.title = title
  }
}
