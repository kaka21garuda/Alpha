//
//  Category.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/9/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

enum Category: String {
    
    case general = "general"
    case business = "business"
    case tech = "technology"
    case science = "science-and-nature"
    case entertainment = "entertainment"
    case music = "music"
    case sport = "sport"
    case gaming = "gaming"
}

let categoryArray: [Category] = [.general, .business, .tech, .science, .entertainment, .music, .sport, .gaming]

class ShowingCategory {
    
    var title = ""
    var category: Category
    var featuredImage: UIImage!
    
    init(title: String, category: Category, featuredImage: UIImage) {
        self.title = title
        self.category = category
        self.featuredImage = featuredImage
    }
    
    static func createCategory() -> [ShowingCategory] {
        return [ ShowingCategory(title: "GENERAL", category: .general, featuredImage: UIImage(named: "generalRed")!),
                 ShowingCategory(title: "BUSINESS", category: .business, featuredImage: UIImage(named: "businessCategory")!),
                 ShowingCategory(title: "TECH", category: .tech, featuredImage: UIImage(named: "technologyCategory")!),
                 ShowingCategory(title: "SCIENCE", category: .science, featuredImage: UIImage(named: "scienceCategory")!),
                 ShowingCategory(title: "ENTERTAINMENT", category: .entertainment, featuredImage: UIImage(named: "entertainmentCategory")!),
                 ShowingCategory(title: "MUSIC", category: .music, featuredImage: UIImage(named: "musicCategory")!),
                 ShowingCategory(title: "SPORT", category: .sport, featuredImage: UIImage(named: "sportCategory")!),
                 ShowingCategory(title: "GAMING", category: .gaming, featuredImage: UIImage(named: "gamingCategory")!),
        ]
    
    }
    
}
