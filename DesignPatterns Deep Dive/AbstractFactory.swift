//
//  FactoryClass.swift
//  DesignPatterns Deep Dive
//
//  Created by Hossam on 30/03/2021.
//

import Foundation
protocol FurnitureFactory{
    func makeChair()->Chair
    func makeTable()->Table
    func makeSofa()->Sofa
}
protocol Wrapable {
    func wrap()->Self
}

extension Wrapable{
    func wrap()->Self {
        self
    }
}
protocol Chair : Wrapable {}
protocol Table : Wrapable {}
protocol Sofa : Wrapable {}


class ModernChair : Chair {}
class ModernSofa: Sofa {}
class ModernTable : Table {}


class ClassicChair : Chair {}
class ClassicSofa : Sofa {}
class ClassicTable : Table {}



class ModernFurniture : FurnitureFactory{
    func makeChair() -> Chair {
        ModernChair()
    }
    
    func makeTable() -> Table {
        ModernTable()
    }
    
    func makeSofa() -> Sofa {
        ModernSofa()
    }
}


class ClassicFurniture : FurnitureFactory {
    func makeChair() -> Chair {
        ClassicChair()
    }
    
    func makeTable() -> Table {
        ClassicTable()
    }
    
    func makeSofa() -> Sofa {
        ClassicSofa()
    }
}


//Usage
class FurnitureBox{
    var box : [ Wrapable]
    init(elements : [Wrapable]) {
       box =  elements.map({$0.wrap()})
    }
}
class Client {
    let furniture : FurnitureFactory
    init(furniture : FurnitureFactory) {
        self.furniture = furniture
    }
    
    func wrapeToBoxes()-> FurnitureBox{
        let chair =  furniture.makeChair()
        let table = furniture.makeTable()
        let sofa = furniture.makeSofa()
        return FurnitureBox(elements: [chair , table , sofa])
    }
}

                              //Classic OR Modern
let client = Client(furniture: ClassicFurniture())
let box = client.wrapeToBoxes().box
