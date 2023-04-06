//
//  Drink.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Drink : Product{
    private var volumeInLiter : Int
    init(name : String, price : Int, volume : Int){
        
        self.volumeInLiter = volume
        super.init(name: name, price: price)
    }
    
    func getVolume() -> Int{
        return self.volumeInLiter
    }
}
