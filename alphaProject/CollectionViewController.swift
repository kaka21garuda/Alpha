//
//  CollectionViewController.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/7/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    var array: [Category] = [.businees, .technology, .general]

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        var button = cell.viewWithTag(1) as! UILabel
        
        button.text = array[indexPath.row].rawValue
        
        return cell
    }
    
}
