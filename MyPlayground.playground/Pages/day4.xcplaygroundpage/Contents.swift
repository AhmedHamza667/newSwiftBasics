//: [Previous](@previous)

import Foundation

//// enum
//enum trafficLight{
//    case green
//    case yellow
//    case red
//    func action() -> String {
//        switch self{
//        case .green:
//            return "Go"
//        case .yellow:
//            return "Slow down"
//        case .red:
//            return "Stop!"
//        }
//    }
//    }
//let signal = trafficLight.yellow
//print(signal.action())
//
//// assosiated type enum
//enum response{
//    case success(message: String)
//    case error(code: Int, message: String)
//    
//    func message() -> String {
//        switch self{
//        case .success(message: let msg):
//            return msg
//        case .error(code: let code, message: let msg):
//            return "Error \(code): \(msg)"
//        }
//    }
//}
//let successfull = response.success(message: "Data loaded successfully")
//let unSuccessfull = response.error(code: 404, message: "Data not found")
//
//print(successfull.message())
//
//enum weatherCondition{
//    case sunny, rainy, cloudy, snowy
//    var condition: String{
//        switch self{
//        case .sunny:
//                "it's a sunny day enjoy"
//        case .rainy:
//                "it's a rainy day stay indoors"
//        case .cloudy:
//                "it's a cloudy day"
//        case .snowy:
//                "it's a snowy day dress warmly"
//        }
//    }
//}
//
//var day1 = weatherCondition.snowy
//print(day1.condition)
//var day2 = weatherCondition.sunny
//print(day2.condition)
//


// Generics - writing a code that works with any data type, by defining a place holder


// Generic Stack - first in last out
//struct Stack<T>{
//    private var items: [T] = []
//    mutating func push(_ element: T){
//        items.append(element)
//    }
//    mutating func pop(){
//        items.removeLast()
//    }
//    var isEmpty: Bool{
//        if items.count == 0{
//            return true
//        }
//        return false
//    }
//    func printStack(){
//        if (self.isEmpty){
//            print("Stack is empty")
//        }
//        else{
//            print("Elements of stack: \(items)")
//        }
//    }
//}
//var stack1 = Stack<Int>()
//stack1.printStack()
//stack1.push(1)
//stack1.push(2)
//stack1.push(3)
//stack1.printStack()
//stack1.pop()
//stack1.printStack()
//stack1.pop()
//stack1.printStack()
//stack1.pop()
//stack1.printStack()
//
//
//var stack2 = Stack<String>()
//stack2.printStack()
//stack2.push("Ahmed")
//stack2.push("Mike")
//stack2.push("Alex")
//stack2.printStack()
//stack2.pop()
//stack2.printStack()
//stack2.pop()
//stack2.printStack()
//stack2.pop()
//stack2.printStack()


//enum leagueWinner<T>{
//    case winningTeam(T)
//    case runnerUp(T, T)
//    case relegated(T, T)
//    var displayMessage: String{
//        switch self {
//        case .winningTeam(let points):
//            return "Congrats on winning the league with \(points) points"
//        case .runnerUp(let teamName, let points):
//            return "\(teamName) came in second place with \(points) points"
//        case .relegated(let teamName, let divison):
//            return "\(teamName) has beem relegated to the \(divison) division good luck next season"
//        }
//    }
//}
//let message = leagueWinner.winningTeam(98).displayMessage
//let message2 = leagueWinner.runnerUp("Arsenal", "93").displayMessage
//let message3 = leagueWinner.relegated("Watford", "2nd").displayMessage
//print(message)
//print(message2)
//print(message3)


//func doAddition(num1: Int, num2: Int, completion: ((Int) -> Void)){
//    let sum = num1 + num2
//    completion(sum)
//}
//doAddition(num1: 5, num2: 10) { result in
//    print("Sum is \(result)")
//}



func closeApps(tasks: [String], completion:@escaping ([String]) -> Void){
    print("Start of function")
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion(tasks)
        print("All apps has been closed ✅")
    }
    print("End of function")
}

// calling function
closeApps(tasks: ["Skype", "Zoom", "Teams", "Chrome"]) { tasks in
    for app in tasks{
        print("\(app) has been closed successfully")
    }
}
