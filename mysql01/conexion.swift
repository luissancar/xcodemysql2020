//
//  conexion.swift
//  mysql01
//
//  Created by Luis José Sánchez Carrasco on 22/01/2020.
//  Copyright © 2020 Luis José Sánchez Carrasco. All rights reserved.
//


import Foundation
 
protocol FeedModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}
 
 
class FeedModel: NSObject, URLSessionDataDelegate {
    
    
    
    weak var delegate: FeedModelProtocol!
    
    let urlPath = "http://iesayala.ddns.net/xcode/xcode.php" //Change to the web address of your stock_service.php file
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Error")
            }else {
                print("stocks downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let stocks = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let stock = StockModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["name"] as? String,
                let price = jsonElement["price"] as? String
        
            {
                print(name)
                print(price)
                stock.name = name
                stock.price = price
               
                
            }
            
            stocks.add(stock)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: stocks)
            
        })
    }
}
