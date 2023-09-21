//
//  ProductsDatabase.swift
//  FirebaseExample
//
//  Created by Alexander Parreira on 21/09/23.
//

import Foundation


struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}


struct Product: Identifiable, Codable{
    let id: Int
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let image: [String]?
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case image
    }
}



/*
func downloadProductsAndUploudFirebase() {
        // https://dummyjson.com/products
    
    guard let url = URL(string: "https://dummyjson.com/products") else {return}
    
    Task {
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let products = try JSONDecoder().decode(ProductArray.self, from: data)
            let productArray = products.products
            
            for product in productArray{
                try? await ProductsManager.shared.uploadProduct(product: product)
            }
            
            print("SUCCESS")
            print(products.products.count)
        } catch{
            print(error)
            
        }
    }
}
 */

final class ProductDatabase{
    
    static let products: [Product] = [
        Product(id: 1, title: Optional("iPhone 9"), description: Optional("An' apple mobiler whitch is nothing like apple"), price: Optional(549), discountPercentage: Optional(12.96), rating: Optional(4.69), stock: Optional(94), brand: Optional("apple"), category: Optional("smartphone"), thumbnail: Optional("https://i.dummyjson.com/data/products/1/1.jpg"), image: Optional(["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thubnail.jpg"])),
        Product(id: 2, title: Optional("iPhone x"), description: Optional("An' apple mobiler whitch is nothing like apple"), price: Optional(549), discountPercentage: Optional(12.96), rating: Optional(4.69), stock: Optional(94), brand: Optional("apple"), category: Optional("smartphone"), thumbnail: Optional("https://i.dummyjson.com/data/products/2/1.jpg"), image: Optional(["https://i.dummyjson.com/data/products/2/1.jpg","https://i.dummyjson.com/data/products/2/2.jpg","https://i.dummyjson.com/data/products/2/3.jpg","https://i.dummyjson.com/data/products/2/4.jpg","https://i.dummyjson.com/data/products/2/thubnail.jpg"])),
        Product(id: 3, title: Optional("iPhone x2"), description: Optional("An' apple mobiler whitch is nothing like apple"), price: Optional(549), discountPercentage: Optional(12.96), rating: Optional(4.69), stock: Optional(94), brand: Optional("apple"), category: Optional("smartphone"), thumbnail: Optional("https://i.dummyjson.com/data/products/2/1.jpg"), image: Optional(["https://i.dummyjson.com/data/products/2/1.jpg","https://i.dummyjson.com/data/products/2/2.jpg","https://i.dummyjson.com/data/products/2/3.jpg","https://i.dummyjson.com/data/products/2/4.jpg","https://i.dummyjson.com/data/products/2/thubnail.jpg"])),
        Product(id: 4, title: Optional("iPhone x3"), description: Optional("An' apple mobiler whitch is nothing like apple"), price: Optional(549), discountPercentage: Optional(12.96), rating: Optional(4.69), stock: Optional(94), brand: Optional("apple"), category: Optional("smartphone"), thumbnail: Optional("https://i.dummyjson.com/data/products/2/1.jpg"), image: Optional(["https://i.dummyjson.com/data/products/2/1.jpg","https://i.dummyjson.com/data/products/2/2.jpg","https://i.dummyjson.com/data/products/2/3.jpg","https://i.dummyjson.com/data/products/2/4.jpg","https://i.dummyjson.com/data/products/2/thubnail.jpg"])),
        Product(id: 5, title: Optional("iPhone x4"), description: Optional("An' apple mobiler whitch is nothing like apple"), price: Optional(549), discountPercentage: Optional(12.96), rating: Optional(4.69), stock: Optional(94), brand: Optional("apple"), category: Optional("smartphone"), thumbnail: Optional("https://i.dummyjson.com/data/products/2/1.jpg"), image: Optional(["https://i.dummyjson.com/data/products/2/1.jpg","https://i.dummyjson.com/data/products/2/2.jpg","https://i.dummyjson.com/data/products/2/3.jpg","https://i.dummyjson.com/data/products/2/4.jpg","https://i.dummyjson.com/data/products/2/thubnail.jpg"])),
        
    ]
}
