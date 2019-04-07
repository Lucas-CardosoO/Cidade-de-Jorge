//
//  CardCollectionViewCell.swift
//  Cidade-de-Jorge
//
//  Created by vinicius emanuel on 07/04/19.
//  Copyright © 2019 vinicius emanuel. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tileImages: UIImageView!
    @IBOutlet weak var label: UILabel!
    var building: Building!
    var location: Location!
}
