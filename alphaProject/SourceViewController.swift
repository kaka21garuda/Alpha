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
//import SwiftyJSON

class SourceViewController: UIViewController {
    
    var instanceOfCategoryViewController: ViewController!
    
    var searchSourceURL = "https://newsapi.org/v1/sources"
    typealias standardJSON = [String : AnyObject]
    
    var sourceNameArray = [String]()
    var sourceIDArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofire(sourceURL: searchSourceURL)
        
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
                    let name = source["name"] as! String
                    let id = source["id"] as! String
                    
                    sourceNameArray.append(name)
                    sourceNameArray.append(id) 
                    
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
