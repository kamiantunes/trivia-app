//
//  CategorieModel.swift
//  Trivia
//
//  Created by Kamilla Mylena Teixeira Antunes on 21/06/22.
//

import Foundation
import Alamofire

struct Category: Codable, Comparable {
    static func < (lhs: Category, rhs: Category) -> Bool {
        lhs.name < rhs.name
    }
    
    let id: Int
    let name: String
}

struct CategoryResponse : Codable{
    enum CodingKeys: String, CodingKey {
        case categories = "trivia_categories"
    }
        
    let categories: [Category]
    
    
}
