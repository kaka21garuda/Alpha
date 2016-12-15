//
//  CategoryCollectionViewCell.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/9/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
//    var category: ShowingCategory! {
//        didSet {
//            updateUI()
//        }
//    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
//    func updateUI() {
//        categoryTitleLabel?.text! = category.title
//        featuredImageView?.image! = category.featuredImage
//    }
    
}
