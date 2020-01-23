//
//  StockModel.swift
//  mysql01
//
//  Created by Luis José Sánchez Carrasco on 22/01/2020.
//  Copyright © 2020 Luis José Sánchez Carrasco. All rights reserved.
//

import Foundation
import UIKit
 
class StockModel: NSObject {
    
    //Campos
    
    var name: String?
    var price: String?
   
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //constructor con @name y @price parámetros
    
    init(name: String, price: String) {
        
        self.name = name
        self.price = price
       
        
    }
    
    
    //prints 
    
    override var description: String {
        return "Name: \(String(describing: name)), Address: \(String(describing: price))"
        
    }
 
}
