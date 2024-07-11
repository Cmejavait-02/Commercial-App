//
//  ShopViewController.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 26/06/24.
//

import Foundation
import UIKit
import SDWebImage


class ShopViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentPage = 1
    var isFetching = false
    let itemsPerPage = 20 // Adjust as needed
    var productData: [Products] = [Products]()
    override func viewDidLoad() {
        
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
                collectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
                
                collectionView.dataSource = self
                collectionView.delegate = self
                
        setupCollectionView()
        
        print("jh")
        fetchProducts()

    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Adjust insets as per your requirement
        layout.minimumLineSpacing = 10 // Adjust as per your requirement
        layout.minimumInteritemSpacing = 10 // Adjust as per your requirement
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (self.collectionView.frame.width - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing) / 2, height: 350) // Adjust height as needed
        
        self.collectionView.collectionViewLayout = layout
    }

  
    
    // MARK: - UICollectionViewDataSource
       
    
    
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return productData.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
               let product = productData[indexPath.item]
               let originalPriceText = "$\(product.price)"
               let discountedPrice = product.price * (1 - product.discountPercentage / 100)
                let discountedPriceText = String(format: "$%.2f", discountedPrice)
               let attributedPriceText = NSMutableAttributedString(string: "\(originalPriceText)  \(discountedPriceText)")
               attributedPriceText.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: originalPriceText.count))
               cell.priceLabel.attributedText = attributedPriceText
               let discountText = "\(product.discountPercentage)% off"
               let attributedDiscountText = NSMutableAttributedString(string: discountText)
               attributedDiscountText.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 0, length: discountText.count))
               cell.discountLabel.attributedText = attributedDiscountText
               
               // Display other product information
               cell.TitleLabel.text = product.title
               cell.DescriptionLabel.text = product.description
               
           if let firstImageURL = product.images.first, let url = URL(string: firstImageURL) {
               cell.ProductImage.sd_setImage(with: url, completed: nil)
               cell.ProductImage.contentMode = .scaleAspectFit
               cell.ProductImage.clipsToBounds = true
           }

           return cell
       }
       
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
               if let ShopViewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
                   let selectedProduct = self.productData[indexPath.item]

                    ShopViewController.productSingle = selectedProduct
                   DispatchQueue.main.async {
                       self.navigationController?.pushViewController(ShopViewController, animated: true)
                           }
               }
           
       }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            // Fetch more data when reaching the last item
            if indexPath.item == productData.count - 1 {
                fetchProducts()
            }
        }
    
     
}

extension ShopViewController {
    func fetchProducts() {
        guard !isFetching else { return }
                isFetching = true
            ProductApi.shared.fetchProducts { result in
                switch result {
                case .success(let products):
                                
                    // Append new products to existing data
                    self.productData.append(contentsOf: products.products)
                    self.currentPage += 1
                    self.isFetching = false
                    DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
                            
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self.isFetching = false

                }
            }
        }
}
