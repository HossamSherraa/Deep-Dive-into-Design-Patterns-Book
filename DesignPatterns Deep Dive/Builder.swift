//
//  Builder.swift
//  DesignPatterns Deep Dive
//
//  Created by Hossam on 30/03/2021.
//

import Foundation

protocol Builder {
    associatedtype Result
    var result : Result { get set }
    func reset()->Self
    func addSeats(number : Int)->Self
    func addEngine()->Self
    func addGPS()->Self
    func getResult()->Result
}
class BuilderButtern{
    

class CarBuider : Builder {
    internal var result: Car  = .init()
    
    func reset()->Self {
        result = Car()
        return self
    }
    
    func addSeats(number: Int)->Self {
        result.seats = 4
        return self
    }
    
    func addEngine()->Self {
        result.engine = "V6 Engine"
        return self
    }
    
    func addGPS()->Self {
        result.isGPSAvaialbel = true
        return self
    }
    
    func getResult() -> Car {
        return result
    }
    
    
    class Director<T:Builder> {
        internal init(builder: T) {
            self.builder = builder
        }
        
        let builder : T
        
        func buildSportCar()->T.Result{
            builder.addEngine()
                .addGPS()
                .addSeats(number: 2)
                .getResult()
        }
        
        func buildCheapCar()->T.Result {
           return builder
                .addEngine()
                .addSeats(number: 4)
                .getResult()
        }
        
    }
}

class Car{
    var seats  = 0
    var engine = ""
    var isGPSAvaialbel : Bool = false
}
    
    
    //Usage
    let cheapCar : Car
    init() {
        let carBulilder = CarBuider()
        let carDirector = CarBuider.Director(builder: carBulilder)
        cheapCar = carDirector.buildCheapCar()
    }
    
}

