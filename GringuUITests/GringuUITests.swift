//
//  GringuUITests.swift
//  GringuUITests
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import XCTest

class GringuUITests: XCTestCase {
  
  func test_launch() {
  }
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }
  override func tearDown() {
    super.tearDown()
  }
}
