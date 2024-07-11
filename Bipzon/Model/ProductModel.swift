//
//  ProductModel.swift
//  Bipzon
//
//  Created by Bishwajit Yadav on 25/06/24.
//

import Foundation
import UIKit

struct ProductModel : Codable {
    var products : [Products] = []
    var total : Int = 0
    var skip : Int = 0
    var limit : Int = 0

    enum CodingKeys: String, CodingKey {

        case products = "products"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }
    init(){}
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Products].self, forKey: .products) ?? [Products]()
        total = try values.decodeIfPresent(Int.self, forKey: .total) ?? 0
        skip = try values.decodeIfPresent(Int.self, forKey: .skip) ?? 0
        limit = try values.decodeIfPresent(Int.self, forKey: .limit) ?? 0
    }

}
struct Dimensions : Codable {
    var width : Double = 0
    var height : Double = 0
    var depth : Double = 0

    enum CodingKeys: String, CodingKey {

        case width = "width"
        case height = "height"
        case depth = "depth"
    }
    init(){}
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        width = try values.decodeIfPresent(Double.self, forKey: .width) ?? 0
        height = try values.decodeIfPresent(Double.self, forKey: .height) ?? 0
        depth = try values.decodeIfPresent(Double.self, forKey: .depth) ?? 0
    }

}
struct Meta : Codable {
    var createdAt : String = ""
    var updatedAt : String = ""
    var barcode : String = ""
    var qrCode : String = ""

    enum CodingKeys: String, CodingKey {

        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case barcode = "barcode"
        case qrCode = "qrCode"
    }
    init(){}
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        barcode = try values.decodeIfPresent(String.self, forKey: .barcode) ?? ""
        qrCode = try values.decodeIfPresent(String.self, forKey: .qrCode) ?? ""
    }

}
struct Products : Codable {
    var id : Int = 0
    var title : String = ""
    var description : String = ""
    var category : String = ""
    var price : Double = 0
    var discountPercentage : Double = 0
    var rating : Double = 0
    var stock : Int = 0
    var tags : [String] = []
    var brand : String = ""
    var sku : String = ""
    var weight : Int = 0
    var dimensions : Dimensions = Dimensions()
    var warrantyInformation : String = ""
    var shippingInformation : String = ""
    var availabilityStatus : String = ""
    var reviews : [Reviews] = []
    var returnPolicy : String = ""
    var minimumOrderQuantity : Int = 0
    var meta : Meta = Meta()
    var images : [String] = []
    var thumbnail : String = ""

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case description = "description"
        case category = "category"
        case price = "price"
        case discountPercentage = "discountPercentage"
        case rating = "rating"
        case stock = "stock"
        case tags = "tags"
        case brand = "brand"
        case sku = "sku"
        case weight = "weight"
        case dimensions = "dimensions"
        case warrantyInformation = "warrantyInformation"
        case shippingInformation = "shippingInformation"
        case availabilityStatus = "availabilityStatus"
        case reviews = "reviews"
        case returnPolicy = "returnPolicy"
        case minimumOrderQuantity = "minimumOrderQuantity"
        case meta = "meta"
        case images = "images"
        case thumbnail = "thumbnail"
    }
    init(){}
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        category = try values.decodeIfPresent(String.self, forKey: .category) ?? ""
        price = try values.decodeIfPresent(Double.self, forKey: .price) ?? 0
        discountPercentage = try values.decodeIfPresent(Double.self, forKey: .discountPercentage) ?? 0
        rating = try values.decodeIfPresent(Double.self, forKey: .rating) ?? 0
        stock = try values.decodeIfPresent(Int.self, forKey: .stock) ?? 0
        tags = try values.decodeIfPresent([String].self, forKey: .tags) ?? [String]()
        brand = try values.decodeIfPresent(String.self, forKey: .brand) ?? ""
        sku = try values.decodeIfPresent(String.self, forKey: .sku) ?? ""
        weight = try values.decodeIfPresent(Int.self, forKey: .weight) ?? 0
        dimensions = try values.decodeIfPresent(Dimensions.self, forKey: .dimensions) ?? Dimensions()
        warrantyInformation = try values.decodeIfPresent(String.self, forKey: .warrantyInformation) ?? ""
        shippingInformation = try values.decodeIfPresent(String.self, forKey: .shippingInformation) ?? ""
        availabilityStatus = try values.decodeIfPresent(String.self, forKey: .availabilityStatus) ?? ""
        reviews = try values.decodeIfPresent([Reviews].self, forKey: .reviews) ?? [Reviews]()
        returnPolicy = try values.decodeIfPresent(String.self, forKey: .returnPolicy) ?? ""
        minimumOrderQuantity = try values.decodeIfPresent(Int.self, forKey: .minimumOrderQuantity) ?? 0
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        images = try values.decodeIfPresent([String].self, forKey: .images) ?? [String]()
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
    }

}

struct Reviews : Codable {
    var rating : Int = 0
    var comment : String = ""
    var date : String = ""
    var reviewerName : String = ""
    var reviewerEmail : String = ""

    enum CodingKeys: String, CodingKey {

        case rating = "rating"
        case comment = "comment"
        case date = "date"
        case reviewerName = "reviewerName"
        case reviewerEmail = "reviewerEmail"
    }
    init(){}

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating) ?? 0
        comment = try values.decodeIfPresent(String.self, forKey: .comment) ?? ""
        date = try values.decodeIfPresent(String.self, forKey: .date) ?? ""
        reviewerName = try values.decodeIfPresent(String.self, forKey: .reviewerName) ?? ""
        reviewerEmail = try values.decodeIfPresent(String.self, forKey: .reviewerEmail) ?? ""
    }

}
