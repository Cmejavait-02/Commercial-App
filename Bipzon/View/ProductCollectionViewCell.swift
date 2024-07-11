//
//  ProductCollectionViewCell.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 26/06/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var ProductImage: UIImageView!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
