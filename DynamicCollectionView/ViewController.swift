//
//  ViewController.swift
//  DynamicCollectionView
//
//  Created by cloudZon Infosoft on 12/07/18.
//  Copyright © 2018 MB. All rights reserved.
//

import UIKit

struct TVProgram {
    var channelName: String!
    var tvProgram: [String]!
}

class ViewController: UIViewController {
    
    var channelArray = [TVProgram(channelName: "Sony", tvProgram: ["Abc","Def"]),
                        TVProgram(channelName: "Z TV", tvProgram: ["123","456","789"]),
                        TVProgram(channelName: "Star Plus", tvProgram: ["!@"])]
    
    var layout: CustomCollectionViewLayout!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "MyCell", bundle: Bundle.main), forCellWithReuseIdentifier: "MyCell")
        layout = collectionView.collectionViewLayout as! CustomCollectionViewLayout
//        layout.sectionHeadersPinToVisibleBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100//channelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80//channelArray[section].tvProgram.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        return CGSize(width: 100, height: 100)
        
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
            return CGSize(width: 200, height: 105)
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
            header.headerTitle.text = channelArray[indexPath.section].channelName
            return header
        }
        else if kind == UICollectionElementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterView", for: indexPath) as! FooterView
            footer.footerTitle.text = channelArray[indexPath.section].channelName
            return footer
        }
        return UICollectionReusableView()
    }
    
}
