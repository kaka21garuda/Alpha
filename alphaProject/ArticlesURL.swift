//
//  ArticlesURL.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/7/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation

enum Category: String {
    case businees = "business"
    case entertainment = "entertainment"
    case gaming = "gaming"
    case general = "general"
    case music = "music"
    case science = "science-and-nature"
    case sport = "sport"
    case technology = "technology"
}

struct ArticlesURL {
    
    var source: String
    let apiKey: String
    
}
