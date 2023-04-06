//
//  Marketplace.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 21/03/23.
//

import Foundation

struct Marketplace{
    private let marketPlace : Array<Store> = [Store(name:"Tuku-tuku", products: [Food(name:"Tahu isi", price:5000, weight: 100), Food(name:"Nasi kuning ", price:15000, weight: 150), Food(name:"Nasi goreng ", price:20000, weight: 150), Drink(name:"Air Mineral", price:5000, volume: 600), Drink(name:"Teh pucuk ", price:5000, volume: 350)]), Store(name: "Gotri", products: [Food(name: "Nasi goreng", price: 30000, weight: 150), Food(name: "Chicken teriyaki donburi", price: 30000, weight: 150), Food(name: "Katsutama Donburi", price: 40000, weight: 170), Food(name: "Yaki Goza", price: 20000, weight: 160), Drink(name:"Ice chocolate", price:10000, volume: 500)]), Store(name: "Madam Lie", products: [Food(name: "Nasi goreng seafood", price: 25000, weight: 150), Food(name: "Nasi goreng jawa", price: 30000, weight: 150), Food(name: "Nasi goreng ayam", price: 30000,weight: 150), Food(name: "Nasi goreng special", price: 35000, weight: 160), Drink(name: "Es teh", price: 5000, volume: 300)]), Store(name: "Kopte", products: [Drink(name: "Teh tarik", price: 15000, volume: 400), Drink(name: "Green tea", price: 10000, volume: 400), Drink(name: "Air mineral", price: 5000, volume: 600), Drink(name:"Orange juice", price:15000, volume: 400)]), Store(name: "EnW", products: [Food(name: "Burger", price: 30000, weight: 150), Food(name: "Sandwich", price: 25000, weight: 130), Drink(name: "Air Mineral", price: 5000, volume: 600), Drink(name: "Milo", price: 10000, volume: 500), Drink(name: "Es teh", price: 10000, volume: 500)])];
    
    private var loggedInUser : User
    init() {
        self.loggedInUser = User(name:"")
    }
    
    func login() -> Void{
        print("")
        print("Welcome to UC Walk")
        print("")
        var runInputUsername = true
        
        while(runInputUsername){
            print("Please input your name : ")
            let username = readLine()
            if (username == ""){
                print("")
                print("Input mustn't be empty")
                print("")
            }else if (username!.isNumber){
                
                print("")
                print("Please input correct format")
                print("")
            }else{
                self.getLoggedInUser().setName(name: username!)
                runInputUsername = false
                print("")
           
            }
            
        }
            
    }
     
    /* function goToShop -> untuk menjalankan program untuk menampilkan menu produk dari setiap toko dan sebagai pengarah dari pilihan pay atau back
    */

    func goToShop(index : Int) -> Void{
        var runStore = true;
        let store = self.marketPlace[index - 1]
        while(runStore){
            
            print("Menu dari \(store.getName())")
            store.displayAllProducts()
            print("0. Back to main menu")
            
            print("Your choice : ")
            let choice = readLine()
            
            if let number = Int(choice!) {
                if(number < 1 || number > store.getTotalProducts()){
                    if(number == 0){
                        runStore = false
                    }else{
                        print("\nThe input must between 1 and \(store.getTotalProducts())\n")
                    }
                    
                }else{
                    
                    self.loggedInUser.addingToCart(product: store.getSpecificProductByIndex(index: number - 1), storeName: store.getName())
                    

                }
            }else{
                print("\nPlease input correctly\n")
            }
            
        }
    }
    
    func getAllStores() -> [Store]{
        return self.marketPlace
    }
    
    func getTheNumberOfStores() -> Int{
        return marketPlace.count
    }
    
    func getLoggedInUser() -> User{
        return self.loggedInUser
    }

 



}
