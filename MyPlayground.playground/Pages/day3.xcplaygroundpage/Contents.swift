
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

// extention
//let num = 6
//extension Int {
//    func square() -> Int {
//        return self * self
//    }
//}
//let s = "hello world"
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
//
//extension Double {
//    func celciusToFahrenheit() -> Double {
//        return (self * 9.0 / 5.0) + 32.0
//    }
//    func fahrenheitToCelcius() -> Double {
//        return (self - 32.0) * 5.0 / 9.0
//    }
//}
//let weatherinF = 77.0
//let weatherinC = 30.0
//print("\(weatherinC) celcius in fahrenheit is \(weatherinC.celciusToFahrenheit())")
//print("\(weatherinF) fahrenheit in celcius is \(weatherinF.fahrenheitToCelcius())")

// extention for classes
//class dog{
//    var name:String = "Jack"
//    var age:Int = 5
//    func bark(){
//        print("woof woof")
//    }
//}
//var myDog = dog()
//myDog.bark()
//extension dog{
//    func sleep(){
//        print("\(self.name) is sleeping zzzzzz")
//    }
//}
//myDog.sleep()


//protocols
protocol team{
    var teamName: String {get set}
    var foundedYear: Int {get set}
}
protocol winning{
    var totalWins: Int {get set}
    mutating func won()
}
protocol losing{
    var totalLosses: Int {get set}
    mutating func lost()
}
//typealias teamData = team & winning & losing // using protocol composition
struct teamA: team, winning, losing{
    var teamName: String
    var foundedYear: Int
    var totalWins: Int
    var totalLosses: Int

    mutating func won() {
        self.totalWins += 1
        print("\(self.teamName) won and the total wins is \(self.totalWins)")
        if self.totalWins == 5{
            print("\(self.teamName) won the league")
        }
    }
    
    mutating func lost() {
        self.totalLosses += 1
        print("\(self.teamName) lost and the total losses is \(self.totalLosses)")
        if self.totalLosses == 5{
            print("\(self.teamName) is out of the league")
        }
    }
}
var ManCity = teamA(teamName: "Man City", foundedYear: 1894, totalWins: 0, totalLosses: 0)
ManCity.won()
ManCity.lost()
ManCity.won()
ManCity.won()
ManCity.won()
ManCity.won()
