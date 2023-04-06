//
//  Store.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 20/03/23.
//

import Foundation

struct Store{
    private var name : String;
    private var products : Array<Product>;
    
    init(name : String, products : Array<Product>){
        self.name = name;
        self.products = Array();
        self.products += products
    }
    
    func getAllProducts() -> Array<Product>{
        return self.products
    }
    
    func displayAllProducts(){
        var counter = 1
        for product in self.getAllProducts() {
            var weightOrVolume : Any = 0
            var satuan = "gram"
            if(product is Food){
                let food = product as! Food
                weightOrVolume =  food.getWeightInGram()
            }else{
                let drink = product as! Drink
                 
                weightOrVolume = drink.getVolume()
                satuan = "liter"
            }
            print("[\(counter)] \(product.getName()) (\(weightOrVolume) \(satuan))");
            counter = counter + 1;
        }
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getTotalProducts() -> Int{
        return self.products.count
    }
    
    func getSpecificProductByIndex(index : Int) -> Product{
        return self.products[index]
    }
}
