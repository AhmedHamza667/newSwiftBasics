
import Foundation

// OOP
// 1. Encpsulation - hiding data from direct access
// 2. Inheritance - Inheriting properties and methods from another class (only single level Inheritance)
// 3. Polymorphisim - having many forms or multiple implenations
// 3. Abstraction - Exposing only required details
// Class - cant copy a class to another class both will be same address unlike struct
// Inheritance / override
// private vs fileprivare
// stored (regular), computed (everytime), and lazy property (only once)
// Protocols!!!

//class Person {
//    fileprivate var name: String // only accessible
//    fileprivate var address: String
//    var gender: Character
//    var isWorking: Bool
//    var age: Int
//    init(name: String, address: String, age: Int, gender: Character, isWorking: Bool) {
//        self.name = name
//        self.address = address
//        self.age = age
//        self.gender = gender
//        self.isWorking = isWorking
//    }
//    func info(){
//        print("\(self.gender == "M" ? "Mr, " : "Ms, ")\(self.name) is living at \(self.address) and he is \(self.age) years old")
//    }
//    func work(){
//        print("\(self.gender == "M" ? "Mr, " : "Ms, ")\(self.name) \(self.isWorking ? "is working" : "not working")")
//    }
//}
//var person1 = Person(name: "Ahmed", address: "120 rock rd", age: 23, gender: "M", isWorking: true)
//var person2 = Person(name: "Alex", address: "122 mariott st", age: 20, gender: "F", isWorking: false)
//person1.info()
//person2.info()
//person1.work()
//person2.work()
//
// Class student inheritance from person
//class Student:Person{
//    private var grade:Int // new var
//    init(grade: Int, name: String, address: String, age: Int, gender: Character, isWorking: Bool) {
//        self.grade = grade
//        super.init(name: name, address: address, age: age, gender: gender, isWorking: isWorking)
//    }
//    func studying(){
//        print("\(self.name) studying and is in grade \(self.grade)")
//    }
//}
//let st1 = Student(grade: 12, name: "Manhace", address: "manhacea 2e", age: 23, gender: "M", isWorking: true)
//st1.studying()

// struct - similar to classes doesn't support Inheritance, imutable by default (doesnt update but u can add keyword mutating) no need for initializer
//struct Car {
//    var make: String
//    var model: String
//    var year: Int
//
//    func carInfo(){
//        print("This car is \(make) \(model) and was made in \(year)")
//    }
//}
//              
//let car1 = Car(make: "Honda", model: "Accord", year: 2015)
//car1.carInfo( )
//var weekTemp = [44,58,60,59,66,30,32]
// simple for loop
//for i in weekTemp{
//    print(i)
//}
//for i in 10...20{ // range loop from 10 to 20
//    print(i)
//}
//for (index, value) in weekTemp.enumerated(){  // index
//    print("day \(index) temp is: \(value)")
//}
//for i in 0..<weekTemp.count{ // iterate through the array
//    print(weekTemp[i])
//}
//var dict = ["Sunday": 44, "Monday": 47, "Tuesday": 39, "Wednesday": 35]
//for (key, value) in dict{
//    print("\(key) temperature is: \(value) degrees")
//}

// while
//var j = 100
//while j > 0{
//    print (j)
//    j /= 2
//}

//repeat{
//    print(j)
//    j -= 10
//} while j > 0


// property types
// stored (regular), computed (everytime), and lazy property (only once)
//var personName:String = "Micheal" // stored
//struct Rectangle {
//    var width: Double
//    var height: Double
//    init(width: Double, height: Double) {
//        self.width = width
//        self.height = height
//    }
//    var area: Double { // computed property
//        return width * height
//    }
//    lazy var create: String = { // lazy property
//        print("Rectangle is being created...")
//        return "Rectangle created"
//    }()
//}
//var rec1 = Rectangle(width: 12.2, height: 22.5)
//print(rec1.area)
//print(rec1.create)

// Optional Chaining (?.) prevents crashes by safely handling nil
//class Car {
//    var model: String
//    init(model: String) {
//        self.model = model
//    }
//}
//
//class Person {
//    var car: Car?
//}
//
//let person = Person()
//
//let carModel = person.car?.model // Returns nil (person has no car)
//print(carModel) // nil



//protocol myProtocol{ // all child classes should have these functions
//    func doSomething()
//    func doSomethingElse()
//}
//class myClass:myProtocol{
//    var speed:Double = 0.0
//    func doSomething() {
//        print("some task")
//        speed+=1
//        print(self.speed)
//
//    }
//    func doSomethingElse() {
//        print("some other task")
//    }
//}
//var c1 = myClass()
//c1.doSomething()
//c1.doSomething()
// extention
//let num = 6
//extension Int {
//    func square() -> Int {
//        return self * self
//    }
//}
//let s = "hello"
//extension String {
//    func capital() -> String {
//        return self.uppercased()
//    }
//    func reverse() -> String {
//        return String(self.reversed())
//    }
//}
//print(num.square());
//print(s.capital())
//print(s.reverse())

// do extention for class

//protocol
/*
 Protocol- Its a blueprint for set of functions or properties, which needs to be implemented when protocol is confrimed on class,struct or enum
 Protocol doesn;t have implemantion
 declartation or funcitons and properties
 Protocols doesnt have there own memory storage
 
 its Basically signature of methods defined in a body of scope
 
 //its also called as Interface in java
 */

//protocol MyProtocol {
//    func doSomeTask()
//    func doAnotherTask()
//}
//
//class MyClass: MyProtocol {
//    func doSomeTask(){
//        print("some task")
//    }
//    
//    func doAnotherTask(){
//        print("doAnotherTask")
//    }
//    
//}
//let c1  = MyClass()
////c1.doSomeTask()
////c1.doAnotherTask()
//
//protocol Servicing{
//    func doRepair()
//}
//protocol Cleaning{
//    func wash()
//}
//protocol Driving{
//    //func
//    func applyBreaks()
//    mutating func aclerate(speed:Double)
//    
//    //computed property
//    var speed:Double{get set}
//}
//extension Driving{
//    func applyBreaks(){
//        print("applying Breaks")
//    }
//}
//class Vehical:Driving{
//    var speed:Double = 0.0
//
//    func aclerate(speed:Double){
//        print("aclerate by \(speed)")
//    }
//    
//}
//let v1 = Vehical()
////v1.aclerate(speed: 10)
////v1.applyBreaks()
//typealias Operating = Servicing & Cleaning // protocol composition
//
////typealias Codeable = Encodable & Decodable
//
//struct Truck: Driving,Operating{
//    func doRepair() {
//        print("doRepair")
//    }
//    
//    func wash() {
//        print("wash")
//
//    }
//    
//    var speed: Double = 10.0
//    
//    mutating func aclerate(speed: Double) {
//        self.speed = self.speed +  speed
//        print("current speed is = \(self.speed)")
//    }
//    
//}
//var t1 = Truck(speed: 20)
//t1.aclerate(speed: 30)
//t1.applyBreaks()
