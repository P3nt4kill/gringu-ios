//
//  GringuAssistant.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation

struct GringuAssistant: BaseModel {
  
  var name: String!
  var picture: String!
  
  init(){}
  init(_ data: [AnyHashable: AnyObject]) {
    name = data["nome"] as? String ?? ""
    
    if let imgs = data["imagens"] as? [[AnyHashable: AnyObject]],
       let first = imgs.first {
       picture = first["url"] as? String ?? ""
    }
  }
}
