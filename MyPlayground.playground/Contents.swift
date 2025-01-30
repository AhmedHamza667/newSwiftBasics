import UIKit
// optionals
//var opt:String?
//print(opt) // nil
//opt = "Ahmed"
//print(opt) // optional(Hello)

// optional bidings
// 1 - if let
// 2 - guard let
// 3 - ?? - nil Coalescing Operator
// 4 - ! Unconditional Unwrapping

//if let name = opt{
//    print("Hello \(name)")
//}
//func checkName (_ opt:String?) {
//    guard let name = opt else{
//        print("No name found")
//        return
//    }
//    print("Hello \(name)")
//}

//checkName(opt)
//print(opt ?? "No name")

// functions
//func dipslayData(){
//    print("Data 1")
//    print("Data 2")
//    print("Data 3")
//}
//dipslayData()
//
//func dipslayNames(name:String, age:Int){
//    print("Hello \(name)")
//    print("You are \(age) years old")
//
//}
//dipslayNames(name: "Ahmed", age: 23)
//
//func addition(_ num1:Int, _ num2:Int){
//    var added = num1+num2
//    print("sum is \(added)")
//}
//addition(2, 4)
//
//func doSquare(num:Int)-> Int{  // return func
//    let square =  num * num
//    return square
//}
//print(doSquare(num: 6))
//
//func makeSquare(num: inout Int){
//    num = num * num
//}
//var squaredNum:Int = 5 // inout
//makeSquare(num: &squaredNum)
//print(squaredNum)
// tuples

//let mytulep = (name:"Ahmed", age:23)
//print(mytulep)
//print(mytulep.1) // just age
// multiple returns
//func doAllMathOpp(num1:Int, num2:Int)-> (Int, Int, Int, Float){
//    let sum = num1 + num2
//    let sub = num1 - num2
//    let mult = num1 * num2
//    let div:Float = Float(num1) / Float(num2)
//    return (sum, sub, mult, div)
//}
//let result = doAllMathOpp(num1: 6, num2: 2)
//print(result)

// control statements
// if else
//var temp = 18
//if temp >= 25{
//    print("It is hot")
//} else {
//    print("It is cold")
//}

// switch statement
//func checkScore(score:Int){
//    switch score {
//    case 0..<50:
//        print("Poor Score")
//    case 50..<70:
//        print("Average Score")
//    case 70..<85:
//        print("Good Score")
//    case 85..<100:
//        print("Excellent Score")
//    default:
//        print("Invalid Socre")
//    }
//}
//checkScore(score: 88)

// guard let
func checkAge(_ age:Int){
    guard age >= 18 else{
        print("you are not legal age")
        return
    }
        print("you are legal age")
}
checkAge(18)
