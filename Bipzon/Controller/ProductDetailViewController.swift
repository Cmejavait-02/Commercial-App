//
//  ProductDetailViewController.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 29/06/24.
//

import Foundation
import UIKit

class ProductDetailViewController : UIViewController {
    
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    var productSingle: Products = Products()
    
    
    
    override func viewDidLoad() {
        
        setImage()
    
    
}

    func setImage() {
        if let imageUrlString = productSingle.images.first,
           let imageUrl = URL(string: imageUrlString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageOutlet.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        self.imageOutlet.image = UIImage(named: "defaultImage")
                    }
                }
            }
        } else {
            imageOutlet.image = UIImage(named: "defaultImage")
        }
    }
    }
