//
//  DisplayViewController.swift
//  alphaProject
//
//  Created by Buka Cakrawala on 12/14/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit

class DisplayViewController: ViewController {
    
    var instanceOfArticle: ArticlesViewController!

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: instanceOfArticle.articleArray[instanceOfArticle.index].url!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        
        self.webView.frame = self.view.bounds
        self.webView.scalesPageToFit = true
        
        self.webView.backgroundColor = UIColor.clear
        self.webView.isOpaque = false
    }
    
}
