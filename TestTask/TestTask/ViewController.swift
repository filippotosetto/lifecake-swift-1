//
//  ViewController.swift
//  TestTask
//
//  Created by Artjom Popov on 10/03/2016.
//  Copyright © 2016 Artjom Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet fileprivate weak var collectionView: UICollectionView!
  
  fileprivate var dataSource = [(id: String, imageName: String)]()
  fileprivate var uniqueKeys = [String]()
  fileprivate let itemsCount = 10000
  
  // MARK: - Initialization
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  required init() {
    super.init(nibName: String(describing: type(of: self)), bundle: nil)
  }
  
  // MARK: - UIView
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.loadData()
    self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
    self.collectionView.reloadData()
  }

  // MARK: -
  
  fileprivate func loadData() {
    let startTime = CACurrentMediaTime()
    
    for i in 0..<self.itemsCount {
      let id = String.randomString(15)
      if !self.uniqueKeys.contains(id) {
        self.uniqueKeys.append(id)
        self.dataSource.append((id: id, imageName: "\(i % 4).jpg"))
      }
    }
    
    let totalTimeSpend = Double(CACurrentMediaTime() - startTime)
    print("total time spend:", totalTimeSpend)
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  // MARK: - UICollectionViewDataSource
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
    let data = self.dataSource[indexPath.row]
    
    cell.configureForImage(data.imageName)
    
    return cell
  }
  
  // MARK: - UICollectionViewDelegate
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let data = self.dataSource[indexPath.row]
    let imageController = ImageViewController(imageName: data.imageName)
    self.navigationController?.present(UINavigationController(rootViewController: imageController), animated: true, completion: nil)
  }
}



