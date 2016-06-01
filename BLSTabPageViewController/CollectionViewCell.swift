//
//  CollectionViewCell.swift
//  BLSTabPageViewController
//
//  Created by Paweł Knuth on 01.06.2016.
//  Copyright © 2016 Paweł Knuth. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    var isChosen:Bool = false
    
    func setupCell(title: String, isChosen: Bool) {
        titleLabel.text = title
        self.isChosen = isChosen
    }
}