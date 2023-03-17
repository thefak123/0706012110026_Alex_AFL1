//
//  main.swift
//  0706012110026-Alex-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation



mainProgram()

func mainProgram() -> Void {
    var runMainProgram = true;
    /* carts -> di dalam array ada dictionaries yang keynya nama toko, valuenya yaitu array dictionaries yang berisi informasi product di setiap toko tersebut
    */
    var carts : Array<[String:Array<[String:Any]>]> = Array()
    while(runMainProgram){
        print("Welcome to UC Walk Cafetaria 😄\nPlease choose cafetaria\n\n[1] Tuku tuku\n[2] Gotri\n[3] Madam lie\n[4] Kopte\n[5] EnW\n-\n[S]hopping cart\n[Q]uit");
        print("Your cafetaria choice : ")
        
        let choice = readLine()
        print("")
        if(choice == "1"){
            let data = [["name" : "Tahu isi", "harga" : 5000],
                        ["name" : "Nasi kuning", "harga":10000],
                        ["name" : "Nasi campur", "harga" : 15000],
                        ["name": "Air mineral", "harga" : 5000],
                        ["name": "Nasi Goreng", "harga" : 7000]]
            goToShop(shopItems:data, carts: &carts, shopName: "Tuku-tuku");
        }else if(choice == "2"){
            let data = [["name" : "Nasi goreng", "harga" : 15000],
                        ["name" : "Chicken teriyaki donburi", "harga":35000],
                        ["name" : "Katsutama Donburi", "harga" : 30000],
                        ["name": "Yaki gyoza", "harga" : 10000],
                        ["name": "Es Coklat", "harga" : 7000]]
            goToShop(shopItems:data, carts: &carts, shopName: "Gotri");
        }else if(choice == "3"){
            let data = [["name" : "Ayam geprek", "harga" : 15000],
                        ["name" : "Nasi sayur", "harga":15000],
                        ["name" : "Nasi campur", "harga": 20000],
                        ["name": "Ayam penyet", "price":15000],
                        ["name": "Air Mineral", "harga" : 7000]]
            goToShop(shopItems:data, carts: &carts, shopName: "Madam Lie");
        }else if (choice == "4"){
            let data = [["name" : "Teh tarik", "harga" : 10000],
                        ["name" : "Kopi hitam", "harga":15000],
                        ["name":"Green tea", "harga":15000],
                        ["name": "Air mineral", "harga":5000],
                        ["name": "Es jeruk", "harga" : 7000]]
            goToShop(shopItems:data, carts: &carts, shopName: "Kopte");
            
        }else if(choice == "5"){
            let data = [["name" : "Burger", "harga" : 30000],
                        ["name" : "Sandwich", "harga":25000],
                        ["name":"Air mineral", "harga": 5000],
                        ["name": "Milo", "harga":10000],
                        ["name": "Es teh", "harga":5000]]
            goToShop(shopItems:data, carts: &carts, shopName: "EnW");
        }else if(choice?.lowercased() == "s"){
            /* function showCart -> untuk menjalankan program untuk fitur keranjang. Penggunaan symbol & digunakan sebagai address untuk reference, sehingga tetap bisa diubah meskipun dipass ke function lain
            */
            showCart(carts: &carts)
        }else if(choice?.lowercased() == "q"){
            runMainProgram = false;
            print("Terimakasih sudah mengunjungi")
        }else{
            print("")
            print("Please input based on the menu")
            print("")
        }
    }
}
 
/* function goToShop -> untuk menjalankan program untuk menampilkan menu produk dari setiap toko dan sebagai pengarah dari pilihan pay atau back
*/

func goToShop(shopItems : [[String:Any]], carts : inout Array<[String:Array<[String:Any]>]>, shopName : String) -> Void{
    var runTukuTukuShop = true;
    
    while(runTukuTukuShop){
        var counter : Int = 1
        print("Menu dari \(shopName)")
        for item in shopItems {
       
            print("[\(counter)] \(item["name"]!)");
            counter = counter + 1;
        }
        print("0. Back to main menu")
        
        print("Your choice : ")
        let choice = readLine()
        
        if let number = Int(choice!) {
            if(number < 1 || number > shopItems.count){
                if(number == 0){
                    runTukuTukuShop = false
                }else{
                    print("\nThe input must between 1 and \(shopItems.count)\n")
                }
                
            }else{
                
                addingToCart(shopItems: shopItems[number - 1], carts: &carts, shopName: shopName)
                

            }
        }else{
            print("\nPlease input correctly\n")
        }
        
    }
}

/* function addingToCart -> untuk menambahkan produk ke keranjang
*/

func addingToCart(shopItems : [String:Any], carts : inout Array<[String:Array<[String:Any]>]>, shopName : String) -> Void{
    var runCheckout = true;

    while(runCheckout){
        let itemName = shopItems["name"]
        let itemPrice = shopItems["harga"]
        print("\(itemName!) @\(itemPrice!)")
        print("How many \(itemName!) do you want to buy : ")
        let num = readLine()
        if let number = Int(num!){
            let store = checkIfStoreExist(carts:carts, val: shopName)
            let storeIndex : Int = store.0
            let storeName : String = store.1
            let idx = number * 1
            if(storeIndex != -1 && idx != -1) {
                let productIndex : Int = checkIfProductExist(products: carts[storeIndex][storeName]!, val: shopItems["name"] as! String).0
                if(productIndex == -1){
                    
                    carts[storeIndex][storeName]?.append(["name" : shopItems["name"]!, "price" : itemPrice!, "quantity" : Int(num!)!])
                }else{
                    let sum : Int = carts[storeIndex][storeName]![productIndex]["quantity"] as! Int + Int(num!)!
                    carts[storeIndex][storeName]![productIndex]["quantity"] = sum
                }
            } else {
                carts.append([shopName : Array()])
                carts[carts.count - 1][shopName]!.append(["name" : shopItems["name"] ?? "", "price" : shopItems["harga"] ?? "", "quantity" : Int(num!) ?? 0])
            }
            
            print("Thank you for ordering")
            
            runCheckout = false
        }else{
            print("Please input the correctly, please try again")
        }
    }
        
}
// function checkIfProductExist -> Melakukan pengecekan apakah product ada di dalam keranjang

func checkIfProductExist(products : Array<[String:Any]>, val : String) -> (Int, String){
    var index : Int = 0
    for product in products{
        
        if(product["name"] as! String == val){
          
            for (key, _) in product{
                return (index, key)
            }
            
        }
        index += 1
    }
   
    return (-1, "")
}

// function shwAllProductsInCart -> Menampilkan setiap produk di keranjang
func shwAllProductsInCart(carts : inout Array<[String:Array<[String:Any]>]>){
  
    if(carts.count != 0){
        for cart in carts{
            for (index, _) in cart{
                print("Your order from \(index)")
                for product in cart[index]!{
                    let name = product["name"]!
                    let quantity = product["quantity"]!
                    print("- \(name) x\(quantity)")
                }
            }
            print("")
        }
        
    }else{
        print("Cart is empty")
        
    }
}

// function checkIfStoreExist -> Check apakah nama toko ada di keranjang
func checkIfStoreExist(carts : Array<[String:Array<[String:Any]>]>, val : String) -> (Int, String){
    var index : Int = 0
    for cart in carts{
        
        if(cart[val] != nil){
            for (key, _) in cart{
                return (index, key)
            }
            
        }
        index += 1
    }
    
    return (-1, "")
}

/* function shwAllProductsInCart -> Menampilkan setiap produk di keranjang & terdapat pilihan antara pengguna ingin membayar (Input P) atau kembali ke menu utama (Input B)
*/
func showCart(carts : inout Array<[String:Array<[String:Any]>]>){
    var runCheckout = true
    if(carts.count > 0){
        while(runCheckout){
            shwAllProductsInCart(carts: &carts)
            print("")
            print("Press [B] to go back")
            print("Print [P] to pay/checkout")
            print("Your choice : ")
            let choice = readLine()
            if(choice?.lowercased() == "b"){
                runCheckout = false
            }else if(choice?.lowercased() == "p"){
                payTheCarts(carts: &carts)
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
func payTheCarts(carts : inout Array<[String:Array<[String:Any]>]>){
    var payingTheCarts = true
    
    while(payingTheCarts){
        var totalPrice : Double = 0
        var index = 0
        for cart in carts {
            for (key, _) in cart{
                for product in carts[index][key]! {
                    let priceStr = product["price"] as? Int
                    let quantity = product["quantity"] as? Int
                    let price : Double = Double(priceStr!)
               
                    totalPrice += price * Double(quantity!)
                }
            }
            index += 1
            
        }
        
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
                    carts.removeAll()
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


