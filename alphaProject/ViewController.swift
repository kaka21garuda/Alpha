//
//  ViewController.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/6/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var indexPathRow: Int!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories = ShowingCategory.createCategory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    struct Storyboard {
        static let cellIdentifier = "cell"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSources" {
            let showSources: SourceViewController = segue.destination as! SourceViewController
            showSources.instanceOfCategoryViewController = self
            
//            let nav  = segue.destination as! UINavigationController
//            let showSources = nav.topViewController as! SourceViewController
            showSources.instanceOfCategoryViewController = self
            
        }
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.category = self.categories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)! as! CategoryCollectionViewCell
        indexPathRow = indexPath.item
    }
    
}

