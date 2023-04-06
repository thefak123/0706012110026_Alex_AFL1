//
//  main.swift
//  0706012110026-Alex-AFL 2
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation



runProgram()

// extension tambahan untuk string untuk check apakah string tersebut merupakan angka
extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

// extention tambahan untuk array untuk membuat setiap elemen pada array unique atau tidak ada yang terduplikat
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}

func runProgram() -> Void {
    var runMainProgram = true;
    /* carts -> di dalam array ada dictionaries yang keynya nama toko, valuenya yaitu array dictionaries yang berisi informasi product di setiap toko tersebut
    */
    let marketPlace = Marketplace()
    marketPlace.login()
    
    while(runMainProgram){
        
        print("Welcome to UC Walk Cafetaria 😄\nPlease choose cafetaria\n");
        for (index, store) in marketPlace.getAllStores().enumerated(){
            print("[\(index + 1)] \(store.getName())")
        }
        print("\n-\n[S]hopping cart\n[Q]uit")
        print("Your cafetaria choice : ")
        
        let choice = readLine()
        
        if let num = Int(choice!){
            if(num > 0 && num <= marketPlace.getTheNumberOfStores()){
                marketPlace.goToShop(index:num)
            }else{
                print("")
                print("Please input based on the menu")
                print("")
            }
            
            
        }else if(choice?.lowercased() == "s"){
            /* function showCart -> untuk menjalankan program untuk fitur keranjang. Penggunaan symbol & digunakan sebagai address untuk reference, sehingga tetap bisa diubah meskipun dipass ke function lain
            */
            marketPlace.getLoggedInUser().goToUserCart()
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

