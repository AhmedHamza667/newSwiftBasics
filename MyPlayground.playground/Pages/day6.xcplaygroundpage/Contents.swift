//: [Previous](@previous)

import Foundation
// Copy on write (COW)- a memory optmization technique by swift to save memory, until you modify a copied element it refares to the same internal memory location
//var array1 = [1,2,3,4,5]
//var array2 = array1 // same location as arr1
//array2.append(6) // new location alocated

// But!! if you modify the orginal array also a new location will be alocated to array 2
//array1.append(50)

// Strong, weak, unowned, weak self for closure
//class Person{ // fix error here
//    var name: String
//    var greet:(()->Void)?
//    init(name: String) {
//        self.name = name
//        print("Class is allocated")
//    }
//    deinit {
//        print("Class is deallocated")
//    }
//    func doInitalSetUp(){
//        greet = { [weak self] in
//            print("Hello, my name is \(self.name)")
//        }
//    }
//}
//var p1:Person? = Person(name: "Ahmed")
//p1.greet?()
//p1.doInitalSetUp()
//p1.greet?()
//p1 = nil

// capture list - used in closure
//var counter = 1
//counter += 1
//let update = { [counter] in // capute from before the closure and save inside the scope
//    print("Counter is \(counter)")
//}
//counter = 4
//update()

protocol Shape{
    associatedtype Area // diffrent var type for each
    mutating func calculateArea() -> Area
}
class Square: Shape{
    typealias Area = Double
    private var side: Double = 2.0
    var area: Area {
        return calculateArea()
    }
     func calculateArea() -> Area {
        return side * side
    }
}

class Rectangle: Shape{
    typealias Area = Int
    private var length: Int = 2
    private var width: Int = 4
    var area: Area {
        return calculateArea()
    }
     func calculateArea() -> Area {
        return length * width
    }
}

class Circle: Shape{
    typealias Area = String
        var area: Area {
        return calculateArea()
    }
     func calculateArea() -> Area {
        return "Circle Area"
    }
}
var sq = Square()
print(sq.calculateArea()) // double
var rec = Rectangle()
print(rec.calculateArea()) // int
var cir = Circle()
print(cir.calculateArea()) // string
