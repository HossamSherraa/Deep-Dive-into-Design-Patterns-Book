//
//  Singleton.swift
//  DesignPatterns Deep Dive
//
//  Created by Hossam on 30/03/2021.
//

class SingletonPROMAX{
    private var somePlayer : String = ""
    static var shared : SingletonPROMAX = .init()
    
    func changeSomePlayer(name : String){
        self.somePlayer = name
    }
}

//Usage

SingletonPROMAX.shared.changeSomePlayer(name: "COCOA")
