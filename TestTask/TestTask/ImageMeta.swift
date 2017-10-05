//
//  ImageMeta.swift
//  TestTask
//
//  Created by Artjom Popov on 11/03/2016.
//  Copyright © 2016 Artjom Popov. All rights reserved.
//

import UIKit

class ImageMeta {
  
  fileprivate static var datesHistory = [String: [Date]]()
  fileprivate var content: UIImage!
  fileprivate var name: String!
  
  lazy var imageSize: () -> String = {
    return "\(self.content.size)"
  }
  
  // MARK: -
  
  func findLastDate() -> String {
    var dates = ImageMeta.datesHistory[self.name]
    
    if var dates = dates {
      let lastDate = dates.last!
      dates.append(Date())
     
      let calendar = Calendar.current
      let components = (calendar as NSCalendar).components([.hour, .minute, .second], from: lastDate)
      
      return "\(String(describing: components.hour)):\(String(describing: components.minute)):\(String(describing: components.second))"
      
    } else {
      dates = [Date()]
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
