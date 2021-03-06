//
//  SourceViewController.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/10/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

import Alamofire

class SourceViewController: UIViewController {
    
    var sourceArray = [Source]()
    
    var sourceIdIndex: Int!
    
    var instanceOfCategoryViewController: ViewController!
    
    var searchSourceURL = "https://newsapi.org/v1/sources"
    typealias standardJSON = [String : AnyObject]
    
    
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
                    
                    let sourceObject = Source(sourceName: (source["name"] as? String)!, sourceId: (source["id"] as? String)!, sourceLogo: (source["urlsToLogos"]?["small"] as? String)!)
                    
                    sourceArray.append(sourceObject)
                    
                }
                collectionView.reloadData()
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    //MARK: - imageFromURL
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL, imageView: UIImageView) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToArticle" {
            let articleView: ArticlesViewController = segue.destination as! ArticlesViewController
            articleView.instanceOfSource = self
        }
    }
    
}

// MARK: - extension

extension SourceViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as! SourceViewCell
        cell.sourceNameLabel.text = sourceArray[indexPath.item].sourceName
        if let sourceLogo = URL(string: sourceArray[indexPath.item].sourceLogo) {
            cell.sourceImage.contentMode = .scaleAspectFit
            downloadImage(url: sourceLogo, imageView: cell.sourceImage)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sourceIdIndex = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let side = (view.frame.width - 60) / 2
        let height = (view.frame.height) / 3
        
        let size = CGSize(width: side, height: height)
        return size
    }
    
}
