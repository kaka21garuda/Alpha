//
//  ArticlesViewController.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/11/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

import Alamofire

class ArticlesViewController: UIViewController {
    
    var articleArray: [Article] = []
    
    @IBOutlet weak var segmentSorting: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var instanceOfSource: SourceViewController!
    
    var searchArticleURL = "https://newsapi.org/v1/articles"
    typealias standardJSON = [String: AnyObject]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofire(url: searchArticleURL)
        collectionView.reloadData()
        
        
    }
    
    func alamofire(url: String) {
        let parameters: Parameters = ["apiKey":"5ae7ebd3853141dab692e3675be9e834", "source":instanceOfSource.sourceArray[instanceOfSource.sourceIdIndex].sourceId]
        
        Alamofire.request(url, parameters: parameters).responseJSON { (response) in
            self.parseData(JSONData: response.data!)
        }
        
    }
    
    func parseData(JSONData: Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! standardJSON
            if let articles = readableJSON["articles"] as? [standardJSON] {
                for i in 0..<articles.count {
                    let article = articles[i]
                    let object = Article(url: article["url"] as! String, imageUrl: checkingImageURL(imageURL: article["urlToImage"] as? String), title: article["title"] as! String)
                   
                    articleArray.append(object)
                    print(articleArray)
                    
                }
                collectionView.reloadData()
            }
        
        } catch {
            
            print(error.localizedDescription)
        }
        
    }
    
    //If picture URL is equal to nil
    func checkingImageURL(imageURL: String?) -> String {
        if imageURL != nil {
            return imageURL!
        } else {
            return "https://az853139.vo.msecnd.net/static/images/not-found.png"
        }
    }
    
    
    func indicator() -> String {
        switch segmentSorting.selectedSegmentIndex {
        case 0:
            return "latest"
        case 1:
            return "top"
        default:
            return "latest"
        }
        //collectionView.reloadData()
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

}

extension ArticlesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! ArticlesViewCell
        if let articleLogo = URL(string: articleArray[indexPath.item].imageUrl!) {
            cell.articlePicture.contentMode = .scaleAspectFit
            downloadImage(url: articleLogo, imageView: cell.articlePicture)
        }
        cell.articleTitleLabel.text = articleArray[indexPath.item].title
        cell.articleTitleLabel.textColor = UIColor.blue
        cell.layer.borderWidth = 5.0
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
