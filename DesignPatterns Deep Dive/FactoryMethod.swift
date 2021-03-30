//
//  FactoryMethod.swift
//  DesignPatterns Deep Dive
//
//  Created by Hossam on 30/03/2021.
//

//ObjectOrianted
//class Transport {
//
//    func startTransport(){
//        shipMethod().delive()
//    }
//
//    func shipMethod ()->Deliverable{
//        fatalError("Should Be Overrided By Subclass")
//    }
//}
//
protocol Deliverable {
    func delive()
}

class Car : Deliverable {
    func delive() {
        print("I'm Delevering ... ")
    }
}

class Train : Deliverable {
    func delive() {
        print("I'm Delevering ... ")
    }
}

//class CarTransport : Transport{
//    override func shipMethod() -> Deliverable {
//        Car()
//    }
//}
//
//
//let carTransport = CarTransport()
//                   .startTransport()


//ProtocolOrianted
protocol Transport {
    func startTransport()
    func shipMethod()->Deliverable
}

extension Transport {
    func startTransport(){
        shipMethod().delive()
    }
}

class CarTransport : Transport {
    func shipMethod() -> Deliverable {
        Car()
    }
    
    
}

