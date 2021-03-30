//
//  Prototype.swift
//  DesignPatterns Deep Dive
//
//  Created by Hossam on 30/03/2021.
//

protocol Copyable{
    func copy()->Self
}

class Cat : Copyable {
     init(name: String, email: String, age: Int) {
        self.name = name
        self.email = email
        self.age = age
    }
    
    private init(cat : Cat){
        name = cat.name
        email = cat.email
        age = cat.age
    }
    let name : String
    let email : String
    let age : Int
    
    
    func copy() -> Self {
        return Cat(cat: self) as! Self
    }
}

let cat = Cat(name: "Possso", email: "posso@gm.com", age: 4)
let anotherCard = cat.copy()
