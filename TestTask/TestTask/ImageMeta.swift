//
//  ImageMeta.swift
//  TestTask
//
//  Created by Artjom Popov on 11/03/2016.
//  Copyright © 2016 Artjom Popov. All rights reserved.
//

import UIKit

class ImageMeta {
  
  private static var datesHistory = [String: [NSDate]]()
  private var content: UIImage!
  private var name: String!
  
  lazy var imageSize: () -> String = {
    return "\(self.content.size)"
  }
  
  // MARK: -
  
  func findLastDate() -> String {
    var dates = ImageMeta.datesHistory[self.name]
    
    if var dates = dates {
      let lastDate = dates.last!
      dates.append(NSDate())
     
      let calendar = NSCalendar.currentCalendar()
      let components = calendar.components([.Hour, .Minute, .Second], fromDate: lastDate)
      
      return "\(components.hour):\(components.minute):\(components.second)"
      
    } else {
      dates = [NSDate()]
      ImageMeta.datesHistory[self.name] = dates
      
      return "no date"
    }
  }
  
  // MARK: -
  
  init(name: String, image: UIImage) {
    self.content = image
    self.name = name
  }
  
  deinit {
    print("ImageMeta deinit")
  }
}