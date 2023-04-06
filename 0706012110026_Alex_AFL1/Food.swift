//
//  Food.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Food : Product{
    
    private var weightInGram : Double
    
    init(name : String, price : Int, weight : Double){
        
        
        self.weightInGram = weight
        super.init(name: name, price: price)
    }
    
    func getWeightInGram() -> Double{
        return self.weightInGram
    }
    
}
