//
//  Product.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 20/03/23.
//

import Foundation

class Product : StoreItem{
    internal var name : String
    internal var price : Int
    
    init(name : String, price : Int){
        self.name = name
        self.price = price
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Int{
        return self.price
    }
    
    func setName(name : String){
        self.name = name
    }
    
    func setPrice(price : Int){
        self.price = price
    }
}
