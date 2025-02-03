//: [Previous](@previous)

import Foundation

//enum Directions:Int, CaseIterable{ // to iterate enum add CaseIterable and .allCases for the loop
//    case north
//    case south
//    case east
//    case west
//}
//for dir in Directions.allCases {
//    print(dir.rawValue)
//}

//enum carBrand:String, CaseIterable{
//    case bmw = "Luxury"
//    case toyota = "Economy"
//    case honda = "Reliable"
//}
//func getCarWorth(carBrand: carBrand) -> String{
//    switch carBrand {
//    case .bmw:
//        "80000 expensive car"
//    case .toyota:
//        "20000 Reliable car"
//    case .honda:
//        "25000 best car"
//    }
//}
//let carWorth = getCarWorth(carBrand: carBrand.honda)
//print(carWorth)

// assosiated type enum
//enum carPrice{
//    case highEnd(price:Int)
//    case midEnd(price:Double)
//    case lowEnd(brand:String)
//}
//func getCarPrices(for modelType: carPrice){
//    switch modelType {
//    case .highEnd(let cost):
//        print("This is a High End car with a price of \(cost)")
//    case .lowEnd(let message):
//        print("This is a budget car \(message)")
//
//    default:
//        print("Not buying this car")
//
//    }
//}
//getCarPrices(for: .highEnd(price: 100000))
//getCarPrices(for: .midEnd(price: 1000.2))
//getCarPrices(for: .lowEnd(brand: "honda"))

//enum WeekDays: CaseIterable{
//    case sun, sat
//    case mon, tue, wed, thr, fri
//    var dayType: String{ // computed property
//        self == .sun || self == .sat ? "Weekend" : "Weekday"
//    }
//    func isHoliday() -> Bool{
//        if self == .sat || self == .sun{
//            return true
//        }
//        return false
//    }
//}
//print(WeekDays.mon.isHoliday())
//print(WeekDays.sat.isHoliday())
//print(WeekDays.sun.dayType)
//print(WeekDays.fri.dayType)


// generics - writing a code that works with any data type, by defining a place holder

//func displayData<T>(_ data: T){
//    print("Displaying data... \(data)")
//}
//func displayAnyData(_ data: Any){
//    print("Displaying data... \(data)")
//}

//displayData("string")
//displayData(12)
//displayData(12.2)
//displayData(true)

//func swap<T>(a: inout T, b: inout T){
//    let temp = a
//    a = b
//    b = temp
//}
//var x = "ah" // works with nums or stings
//var y = "ha"
//print("x: \(x), y: \(y)")
//
//swap(a: &x, b: &y)
//print("x: \(x), y: \(y)")

// generic queue
//struct Queue<T>{
//    private var items: [T] = []
//    mutating func enqueue(_ element: T){
//        items.append(element)
//    }
//    mutating func dequeue() -> T?{
//        guard !isEmpty else {return nil}
//        return items.removeFirst()
//    }
//    var isEmpty: Bool{
//        if items.count == 0{
//            return true
//        }
//        return false
//    }
//    func printQueue(){
//        if (self.isEmpty){
//            print("Array is empty")
//        }
//        else{
//            print("Element of queue: \(items)")
//        }
//    }
//    
//}
//var listOfNames = Queue<String>()
//print(listOfNames.isEmpty)
//listOfNames.enqueue("Ahmed")
//listOfNames.enqueue("Alex")
//listOfNames.enqueue("Mike")
//listOfNames.printQueue()
//listOfNames.dequeue()
//listOfNames.printQueue()
//print(listOfNames.isEmpty)
//
//var listOfNums = Queue<Int>()
//listOfNums.enqueue(1)
//listOfNums.enqueue(2)
//listOfNums.enqueue(3)
//listOfNums.enqueue(4)
//listOfNums.printQueue()
//listOfNums.dequeue()
//listOfNums.dequeue()
//listOfNums.printQueue()
//listOfNums.dequeue()
//listOfNums.dequeue()
//listOfNums.printQueue()
//

//enum Reward<T>{
//    case firstPrize(T)
//    case secondPrize(T)
//    case thirdPrize(T)
//    var displayRewardValue: String{
//        switch self {
//        case .firstPrize(let value):
//            return "First Prize: \(value)"
//        case .secondPrize(let value):
//            return "Second Prize: \(value)"
//        case .thirdPrize(let value):
//            return "Third Prize: \(value)"
//        }
//    }
//}
//let message = Reward.firstPrize(1000).displayRewardValue
//let message2 = Reward.secondPrize("Car").displayRewardValue
//print(message)


// closures - unnamed block of code which you can assign to a var / pass as paremeter or return from a function

//let helloClosure = {
//    print("Hello World!")
//}
//helloClosure()

//func greetPeople(wishthem: () -> (Void)){ // void or just -> (){}
//    print("we are in a closure function")
//    wishthem()
//}
//
//
////greetPeople(wishthem: {print("Hi"); print("How"); print("are"); print("you")})
//// same as -->
//greetPeople{ // this is auto closure
//    print("Hi")
//    print("How")
//    print("are")
//    print("you")
//}

//func doAddition(num1: Int, num2: Int, completion: ((Int) -> Void)){
//    let sum = num1 + num2
//    completion(sum)
//}
//doAddition(num1: 5, num2: 10) { result in
//    print("Sum is \(result)")
//}
//print(sum)

// 1. Non - Ecaping closure (default) - finishes its work before end of function - doesn't outlive outside the scope of function
// 2. Escaping closure - outlives the scope of the function, gets evauluated some time in the future, used for async programming like Api
// 3. trailling closure - when a closure i the last paremeter in a func
// 4. Auto closure - when a closure gets automatically wrapped in a block of code and which doesn't accept any paremeter nor returns something


//func escapingClosure(url: String, completion:@escaping () -> Void){
//    print("Start of func")
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//        completion()
//        print("Finished work")
//    }
//    print("End of func")
//}
//
// calling function
//escapingClosure(url: "https://www.facebook.com/api") {
//    print("Api call started")
//    print("Api call in progress")
//    print("Api call finished")
//}
