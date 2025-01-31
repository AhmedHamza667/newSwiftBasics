//: [Previous](@previous)

import Foundation

// OOP
// 1. Encpsulation - hiding data from direct access
// 2. Inheritance - Inheriting properties and methods from another class (only single level Inheritance)
// 3. Polymorphisim - having many forms or multiple implenations
// 3. Abstraction - Exposing only required details
// Class -
// Inheritance / override
// private vs fileprivare

class Human {
    fileprivate var name: String
    var address: String
    var age: Int
    init(name: String, address: String, age: Int) {
        self.name = name
        self.address = address
        self.age = age
    }
    func walk(){
        print("I am walking")
    }
    func work(){
        print("Mr, \(self.name) is working")
    }
}

class Student:Human{
    private var rollNum:Int
    init(rollNum: Int, name: String, address: String, age: Int) {
        self.rollNum = rollNum
        super.init(name: name, address: address, age: age)
    }
    func studying(){
        print("\(self.name) studying")
    }
}
let st1 = Student(rollNum: 12, name: "Manhace", address: "manhacea 2e", age: 23)
st1.studying()
