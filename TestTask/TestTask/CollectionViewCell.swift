//
//  CollectionViewCell.swift
//  TestTask
//
//  Created by Artjom Popov on 10/03/2016.
//  Copyright © 2016 Artjom Popov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  @IBOutlet fileprivate weak var imageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configureForImage(_ name: String) {
    self.loadThumbnail(name) { (thumb) -> Void in
      self.imageView.image = thumb
    }
  }
  
  // MARK: -
  
  fileprivate func loadThumbnail(_ name: String, completion: @escaping (_ thumb: UIImage) -> Void) {
    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
      let image = UIImage(named: name)!
      let thumbnail = self.thumbnailFromImage(image)
      
      completion(thumbnail)
    }
  }
  
  fileprivate func thumbnailFromImage(_ image: UIImage) -> UIImage {
    let cgImage = image.cgImage
    
    let width = (cgImage?.width)! / 3
    let height = (cgImage?.height)! / 3
    let bitsPerComponent = cgImage?.bitsPerComponent
    let bytesPerRow = cgImage?.bytesPerRow
    let colorSpace = cgImage?.colorSpace
    let bitmapInfo = cgImage?.bitmapInfo
    
    let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent!, bytesPerRow: bytesPerRow!, space: colorSpace!, bitmapInfo: (bitmapInfo?.rawValue)!)
    
    context!.interpolationQuality = CGInterpolationQuality.high
    
    context?.draw(cgImage!, in: CGRect(origin: CGPoint.zero, size: CGSize(width: CGFloat(width), height: CGFloat(height))))
    
    return UIImage(cgImage: context!.makeImage()!)
  }
}
