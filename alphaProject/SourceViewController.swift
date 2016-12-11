//
//  SourceViewController.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/10/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit

import Alamofire

class SourceViewController: UIViewController {
    
    var sourceNameArray = [String]()
    var sourceIDArray = [String]()
    var sourceURLLogoArray = [String]()
    
    var instanceOfCategoryViewController: ViewController!
    
    var searchSourceURL = "https://newsapi.org/v1/sources"
    typealias standardJSON = [String : AnyObject]
    
    var name: String?
    var id: String?
    var url: String?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    struct Storyboard {
        static let cellIdentifier = "sourceCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofire(sourceURL: searchSourceURL)
        collectionView.reloadData()
    }
    
    func alamofire(sourceURL: String) {
        let parameters: Parameters = ["language":"en",
                                      "country":"us",
                                      "category": categoryArray[instanceOfCategoryViewController.indexPathRow].rawValue
                                            ]
        Alamofire.request(sourceURL, parameters: parameters).responseJSON { (response) in
            self.parseData(JSONData: response.data!)
        }
        
    }
    
    func parseData(JSONData: Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! standardJSON
            if let sources = readableJSON["sources"] as? [standardJSON] {
                for i in 0..<sources.count {
                    let source = sources[i]
                    name = source["name"] as? String
                    id = source["id"] as? String
                    url = source["urlsToLogos"]?["small"] as? String
                    
                    sourceNameArray.append(name!)
                    sourceIDArray.append(id!)
                    sourceURLLogoArray.append(url!)
                }
                print(sourceNameArray)
                collectionView.reloadData()
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL, imageView: UIImageView) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                imageView.image = UIImage(data: data)
            }
        }
    }
    
}

// MARK: - extension

extension SourceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as! SourceViewCell
        cell.sourceNameLabel.text = sourceNameArray[indexPath.item]
        if let sourceLogo = URL(string: sourceURLLogoArray[indexPath.item]) {
            cell.sourceImage.contentMode = .scaleAspectFit
            downloadImage(url: sourceLogo, imageView: cell.sourceImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}



