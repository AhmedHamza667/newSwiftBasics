//: [Previous](@previous)

import Foundation

// higher order function - map, filter, sort, reduce, for each
// Map

// convert to a string array
//var numbers = [1, 2, 3, 4, 5, 6]
//print("Original array: \(numbers)")
//var stringNumbers = numbers.map { "Number: \($0)" }
//print("Converted to a string array: \(stringNumbers)")
//// get word count for fruits
//var fruits = ["apple", "banana", "orange", "grape"]
//print("Original array: \(fruits)")
//var wordLength = fruits.map { "\($0) word count is: \($0.count)" }
//print("Uppercased array: \(wordLength)")
//
//struct Employee{
//    var name: String
//    var employeeId: Int
//    var dept: String
//}
//let employees = [
//    Employee(name: "Alice", employeeId: 1, dept: "IT"),
//    Employee(name: "Bob", employeeId: 2, dept: "HR"),
//    Employee(name: "Charlie", employeeId: 3, dept: "IT"),
//    Employee(name: "Ronald", employeeId: 4, dept: "Managment"),
//    Employee(name: "Mike", employeeId: 5, dept: "IT"),
//    Employee(name: "Zack", employeeId: 6, dept: "IT")
//]
// get only names
//let employeeNames = employees.map{$0.name}
//print(employeeNames)

// Transforming a Dictionary into a Flat List
//var Teams: [String: String] = ["Team A": "Ahmed", "Team B": "Alex", "Team C": "Eve"]
//let allPlayes = Teams.map{$0.value}
//print(allPlayes)

//// filter
//let employeesInIT = employees.filter{$0.dept == "IT"}
//print(employeesInIT.map{$0.name}) // print only names!
//
//// sort
//var dictArray = [("Ahmed", 80), ("Alex", 90), ("Charlie", 77), ("David", 92), ("Eve", 65)]
//
//// Sort the array based on the score
//dictArray.sort { $0.1 > $1.1 }
//
//print(dictArray)

//// reduce - just returns one single value
//var nums = [1,2,3,4]
//let sumOfAll = nums.reduce(0) {$0 + $1}// 0 is the initial value
//print(sumOfAll)
//var findMax = [22, 123, 423, 344, 5, 1, 34]
//var maxNum = findMax.reduce(findMax[0]){ max($0, $1)} // initialize first index as max
//print(maxNum)

//// flatmap - flattens nested collection
//let mixarray = [["A", "B", "C"], ["D", "E", "F"], ["H", "I", "J"]]
//print(mixarray)
//let flattenedArray = mixarray.flatMap { $0 }
//print(flattenedArray)
//
//// compact map - remove nil from collection
//let numbers = ["10", "20", "abc", "30", "xyz", "40"]
//
//// Convert valid strings to Int
//let validNumbers = numbers.compactMap { Int($0) }
//print(validNumbers)

//// for each
//let students = ["Alice": 80, "Bob": 90, "Charlie": 77, "David": 92, "Eve": 65]
//students.forEach { (name, score) in
//    if score >= 90 {
//        print("\(name) is doing well!")
//    }
//    else if score > 70 {
//        print("\(name) needs to improve.")
//    }
//    else{
//        print("\(name) is stupid.")
//    }
//}


// convenience init
//class Car{
//    var make:String
//    var model:String
//    var year:Any
//    init(make: String, model: String, year: Any) {
//        self.make = make
//        self.model = model
//        self.year = year
//    }
//    convenience init(make: String, model: String) {
//        self.init(make: make, model: model, year: "Unkown year")
//    }
//    convenience init(make: String, year: Int) {
//        self.init(make: make, model: "Unkown model", year: 2020)
//    }
//    convenience init(make: String) {
//        self.init(make: make, model: "Unkown model", year: "Unkown year")
//    }
//
//}
//var car1 = Car(make: "Honda", model: "Accord", year: 2015)
//var car2 = Car(make: "Tesla", model: "3")
//var car3 = Car(make: "BMW", year: 2023)
//var car4 = Car(make: "Mercedes")


// failable initializer
//class Div {
//    var num1, num2, res: Double
//    init?(num1: Double, num2: Double) {
//        if num2 == 0{
//            return nil
//        }
//        self.num1 = num1
//        self.num2 = num2
//        self.res = num1 / num2
//    }
//}
//var div1 = Div(num1: 40, num2: 4)
//var div2 = Div(num1: 40, num2: 0)
//if let div3 = Div(num1: 10, num2: 5){
//    print("Division is successful the result is \(div3.res)")
//}
//else {
//    print("Failed to calculate result")
//}


// Error handling

//enum InvalidInput:Error{
//    case invalidEmail
//    case invalidPassword
//    case successfullyLoggedIn
//}
//func login(email: String, password: String) throws -> String {
//    if email != "ahmed@test.com" {
//        throw InvalidInput.invalidEmail
//    } else if password != "Password" {
//        throw InvalidInput.invalidPassword
//    }
//    return "Successfully Logged In"
//}
//
//do{ // do catch try if error suspected
//    try login(email: "ahmed@test.com", password: "Password")
//    print("Success")
//    } catch{
//    print(error)
//}
//
//// try ? or try! to force unwrap
//let message = try? login(email: "ahmed@test.com", password: "Password")
//// if error will return nil
//print(message)
