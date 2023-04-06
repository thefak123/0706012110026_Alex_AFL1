//
//  ProductCart.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 20/03/23.
//

import Foundation

class CartItem{
    private var product : Product
    private var quantity : Int
    private var storeName : String
    init(product : Product, storeName : String, quantity : Int){
        self.product = product
        self.storeName = storeName
        self.quantity = quantity
    }
    
    func getProduct() -> Product{
        return self.product
    }
    
    func addProductQuantity(qty : Int) -> Void{
        self.quantity += qty
    }
    
    func getStoreName() -> String{
        return self.storeName
    }
    
    func getQuantity() -> Int{
        return self.quantity
    }
}
