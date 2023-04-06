//
//  User.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 20/03/23.
//

import Foundation


class User{
    private var name : String;
    private var carts : Array<CartItem>;
    
    init(name : String){
        self.name = name
        self.carts = Array()
    }
    
    func getCarts() -> Array<CartItem>{
        return self.carts
    }
    
    func emptyCarts(){
        self.carts.removeAll()
    }
    
    func getName() -> String{
        return self.name;
    }
    
    func getTotalPriceOfCart() -> Double{
        return Double(self.carts.reduce(0.0) { $0 + (Double($1.getProduct().getPrice()) * Double($1.getQuantity())) })
    }
    
    func setName(name : String){
        self.name = name
    }
    
    /* function addingToCart -> untuk menambahkan produk ke keranjang
    */

    func addingToCart(product : Product, storeName : String) -> Void{
        var runCheckout = true;

        while(runCheckout){
           
            print("\(product.getName()) @\(product.getPrice())")
            print("How many \(product.getName()) do you want to buy : ")
            let num = readLine()
            if let number = Int(num!){
                if(number > 0){
                    let productCart = CartItem(product: product, storeName: storeName, quantity: number)
                    self.addToCart(product: productCart)
                    print("Product \(product.name) x\(number) berhasil ditambahkan ke keranjang")
                    runCheckout = false
                }else{
                    print("")
                    print("The quantity must be equal or more than one")
                    print("")
                }
               
            }else{
                print("")
                print("Please input correctly, please try again")
                print("")
            }
        }
            
    }

    func goToUserCart(){
        var runCheckout = true
        
        if(self.getCarts().count > 0){
            while(runCheckout){
                self.showAllProductsInCart()
                print("")
                print("Press [B] to go back")
                print("Print [P] to pay/checkout")
                print("Your choice : ")
                let choice = readLine()
                if(choice?.lowercased() == "b"){
                    runCheckout = false
                }else if(choice?.lowercased() == "p"){
                    self.payTheCarts()
                    runCheckout = false
                }else{
                    print("")
                    print("Please input correctly")
                    print("")
                }
            }
        }else{
            print("")
            print("Your cart is empty")
            print("")
        }
        
    }

    // payTheCarts -> Melakukan pembayaran dari keranjang
    func payTheCarts(){
        var payingTheCarts = true
        
        while(payingTheCarts){
            let totalPrice : Double = self.getTotalPriceOfCart()
        
            
            
            print("Total price : \(totalPrice)" )
            
            print("Please input the amount of money : ")
            
            let money = readLine()
            print("")
            if(money == ""){
                print("Please enter the amount of money")
            }else{
                if let money = Double(money!){
                    if money >= totalPrice {
                        
                        print("Total order : \(totalPrice)")
                        print("You pay : \(money)")
                        print("your change \(money - totalPrice)")
                        print("Enjoy your meals")
                        self.emptyCarts()
                        payingTheCarts = false
                        print("")
                    }else if money == 0{
                        print("")
                        print("Money can't be zero")
                        print("")
                    }else if money < 0 {
                        print("")
                        print("Please enter correct format")
                        print("")
                    }else{
                        print("")
                        print("You don't have enough money")
                        print("")
                    }
                }else{
                    print("Please enter correct format")
                }
            }
        }
       
    }
    
    func addToCart(product : CartItem){
        if let index = carts.firstIndex(where: {$0.getProduct().getName() == product.getProduct().getName()}){
            carts[index].addProductQuantity(qty: product.getQuantity())
            
        }else{
            self.carts.append(product)
            
        }
                
    }
    
    func showAllProductsInCart(){
        if(self.carts.count != 0){
            var allStore = carts.map{$0.getStoreName()}
            allStore = allStore.unique()
            
            for store in allStore{
                
                print("Your order from \(store)")
                let products = carts.filter { $0.getStoreName() == store }
                let foods = products.filter{$0.getProduct() is Food}
                let drinks = products.filter{$0.getProduct() is Drink}
                
                if(!foods.isEmpty){
                    print("Foods : ")
                    for food in foods{
                        
                        let name = food.getProduct().getName()
                        let quantity = food.getQuantity()
                        print("- \(name) x\(quantity)")
                        
                        
                    }
                }
                
                if(!drinks.isEmpty){
                    print("Drinks : ")
                    for drink in drinks{
                        
                        let name = drink.getProduct().getName()
                        let quantity = drink.getQuantity()
                        print("- \(name) x\(quantity)")
                        
                        
                    }
                }
                
                print("")
                
            }
                
            }else{
                print("Cart is empty")
                
            }
        }
    }
    
    


