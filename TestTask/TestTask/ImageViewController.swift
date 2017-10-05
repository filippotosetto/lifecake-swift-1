//
//  ImageViewController.swift
//  TestTask
//
//  Created by Artjom Popov on 11/03/2016.
//  Copyright © 2016 Artjom Popov. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
  
  fileprivate var imageName: String!
  fileprivate var imageView: ImageView!
  fileprivate var imageMeta: ImageMeta!
  
  // MARK: - Initialization
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  required init(imageName: String) {
    super.init(nibName: String(describing: type(of: self)), bundle: nil)
    self.imageName = imageName
  }
  
  // MARK: - UIView
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
   
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ImageViewController.close))
    
    self.imageView = UINib(nibName: "ImageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? ImageView
    
    self.loadImage() { image in
      self.imageView?.setupWithImage(image, inView: self.view)
      
      let imageMeta = ImageMeta(name: self.imageName, image: image)
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 320))
      label.text = String(format: "Last opened: %@, size: %@", imageMeta.findLastDate(), imageMeta.imageSize())
      label.font = UIFont.systemFont(ofSize: 10)
      self.navigationItem.titleView = label
    }
  }
  
  // MARK: -
  
  @objc fileprivate func close() {
    self.navigationController?.dismiss(animated: true, completion: nil)
  }
  
  fileprivate func loadImage(_ completion: @escaping (_ image: UIImage) -> Void) {
    
    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
      let image = UIImage(named: self.imageName)!
      
      DispatchQueue.main.async(execute: { () -> Void in
        completion(image)
      })
    }
  }
}
