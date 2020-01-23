//
//  ViewController.swift
//  mysql01
//
//  Created by Luis José Sánchez Carrasco on 22/01/2020.
//  Copyright © 2020 Luis José Sánchez Carrasco. All rights reserved.
//

import UIKit
var feedItems: NSArray = NSArray()
var selectedStock : StockModel = StockModel()
class ViewController: UIViewController, FeedModelProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let feedModel = FeedModel()
        feedModel.delegate = self
        feedModel.downloadItems()
        
      //  let item:StockModel=feedItems[0] as! StockModel
       
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        print("dggg")
    }
    func itemsDownloaded(items: NSArray) {
           feedItems=items
        print("terminado")
        let a:StockModel=feedItems[0] as! StockModel
        print(a.name!  )
        
       }
}

