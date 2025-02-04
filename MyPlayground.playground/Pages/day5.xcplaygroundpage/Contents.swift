//: [Previous](@previous)

import Foundation

// higher order function - map, filter, sort, reduce, for each
// Map
//var numbers = [1, 2, 3, 4, 5, 6]
//print("Original array: \(numbers)")
//numbers = numbers.map { $0 * $0 }
//print("Squared array: \(numbers)")
//
//var fruits = ["apple", "banana", "orange", "grape"]
//print("Original array: \(fruits)")
//fruits = fruits.map { $0.uppercased() }
//print("Uppercased array: \(fruits)")
//
//struct Employee{
//    var name: String
//    var employeeId: Int
//}
//let employees = [
//    Employee(name: "Alice", employeeId: 1),
//    Employee(name: "Bob", employeeId: 2),
//    Employee(name: "Charlie", employeeId: 3),
//]
//
//let employeeNames = employees.map{$0.name}
//print(employeeNames)
// filter
//let employeesNamesEndsWithE = employees.filter{$0.name.last == "e"}
//print(employeesNamesEndsWithE.map{$0.name})
//let nums = [1,2,3,4,5,6,7,8]
//let evens = nums.filter { $0 % 2 == 0 }
//print(evens)

// sort
//let nums = [1,32,12,56,12,78,4]
//let sortedNums = nums.sorted()
//print(sortedNums)
//let reverseSorted = nums.sorted(by: >) // or nums.sorted{$0 > $1}
//print(reverseSorted)
//
//// reduce - just returns one single value
//let sumOfAll = nums.reduce(1,+) // 1 is the initial value
//print(sumOfAll)

// flatmap - flattens nested collection
//let mixarray = [[1,2,3], [4,5,6], [7,8,9]]
//print(mixarray)
//let flattenedArray = mixarray.flatMap { $0 }
//print(flattenedArray)

// compact map - remove nil from collection
//let nilArr = [1, nil, 3, 4, 5, nil]
//print(nilArr)
//let withoutNil = nilArr.compactMap { $0 }
//print(withoutNil)

// for each
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
//class ProgrammingLang{
//    var name:String
//    var yearsOfExp:Int
//    init(name: String, yearsOfExp: Int) {
//        self.name = name
//        self.yearsOfExp = yearsOfExp
//    }
//    convenience init(name: String) {
//        self.init(name: name, yearsOfExp: 0)
//    }
//    convenience init(yearsOfExp: Int) {
//        self.init(name: "unkown", yearsOfExp: yearsOfExp)
//    }
//
//}
//var lan1 = ProgrammingLang(name: "Swift", yearsOfExp: 2)
//var lan2 = ProgrammingLang(yearsOfExp: 2)
//var lan3 = ProgrammingLang(name: "Swift")

// failable initializer init?(var, var){if var1 > 5 return nil}

// required init

// Error handling

enum DivisionError:Error{
    case divideByZero
    case invalidInput
}
func division(num1: Double, num2: Double) throws -> Double{
    guard num2 != 0 else {
        throw DivisionError.divideByZero
    }
    return num1 / num2
}

do{ // do catch try if error suspected
    let res = try division(num1: 100, num2: 2)
    print(res)
} catch{
    print(error)
}

// try ? or try! to force unwrap
let res1 = try? division(num1: 25, num2: 9) // if error will return nil
print(res1) // res1 ?? "invalid"
