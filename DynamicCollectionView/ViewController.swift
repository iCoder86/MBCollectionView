//
//  ViewController.swift
//  DynamicCollectionView
//
//  Created by cloudZon Infosoft on 12/07/18.
//  Copyright © 2018 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var layout: UICollectionViewFlowLayout!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 200, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "MyCell", bundle: Bundle.main), forCellWithReuseIdentifier: "MyCell")
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.configure(header: "Hello", desc: "This is title Description")
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item % 5 == 0 {
            return CGSize(width: 500, height: 100)
        }
        else if indexPath.item % 4 == 0 {
            return CGSize(width: 400, height: 100)
        }
        else if indexPath.item % 3 == 0 {
            return CGSize(width: 300, height: 100)
        }
        else if indexPath.item % 2 == 0 {
            return CGSize(width: 200, height: 100)
        }
        else {
            return CGSize(width: 100, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
