//
//  MyCell.swift
//  DynamicCollectionView
//
//  Created by cloudZon Infosoft on 12/07/18.
//  Copyright © 2018 MB. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(header: String, desc: String) {
        lblHeader.text = header
        lblDescription.text = desc
    }
}
