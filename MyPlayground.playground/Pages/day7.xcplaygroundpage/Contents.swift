//: [Previous](@previous)

import Foundation
// dependacy injection - when a class needs to preforn a functionality, we pass it from outside instead hard coding it
// construction injection
// property injection
// method injection

//protocol PaymentProcessor{
//    func processPayment(amount: Double) -> String
//}
//class PayPalPaymentProcessor: PaymentProcessor{
//    init(){
//        print("PayPalPaymentProcessor initalized")
//    }
//    func processPayment(amount: Double) -> String {
//        return "Payment processed through PayPal with amout of \(amount)"
//    }
//    deinit{
//        print("PayPalPaymentProcessor deinitialized")
//    }
//}
//class StripePaymentProcessor: PaymentProcessor{
//    init(){
//        print("Stripe initalized")
//    }
//    func processPayment(amount: Double) -> String {
//        return "Payment processed through Stripe with amout of \(amount)"
//    }
//    deinit{
//        print("StripePaymentProcessor deinitialized")
//    }
//}
//class ViewController{
//    let paymentProcessor: PaymentProcessor
//    init(paymentProcessor: PaymentProcessor) {
//        self.paymentProcessor = paymentProcessor
//        print("ViewController initalized")
//
//    }
//    func makePayment(_ amount: Double) -> String{
//        return paymentProcessor.processPayment(amount: amount)
//    }
//    deinit{
//        print("ViewController deinitialized")
//    }
//}
//var payment1:ViewController? = ViewController(paymentProcessor: PayPalPaymentProcessor())
//payment1?.makePayment(200.3)
//// or payment2?.makePayment(100.3, with: StripePaymentProcessor())
//var payment2:ViewController? = ViewController(paymentProcessor: StripePaymentProcessor())
//payment2?.makePayment(100.3)
//payment1 = nil // both viewcontroller and paypal will be deinit
//payment2 = nil



//class Car {
//    private var speed: Int = 0
//    
//    func accelerate() {
//        speed += 10
//    }
//    func printSpeed() {
//        print(speed)
//    }
//}
//
//let car = Car()
////print(car.speed) // Error
////car.speed = 100 // Error: speed is inaccessible
//car.accelerate()
//car.accelerate()
//car.accelerate()
//car.printSpeed()


//POP- Portocol Oriented Programming

//protocol Task{
//    var title: String {get set}
//    func performTask()
//}
//protocol SchedulableMeeting{
//    var isSchedulable: Bool {get set}
//    var meetingTime: String? {get set}
//}
//protocol DebuggableCode{
//    var isDebuggable: Bool {get set}
//    var doneBy: String? {get set}
//}
//class CodingTask: Task, DebuggableCode{
//    var title: String
//    var isDebuggable: Bool
//    var doneBy: String?
//    
//    init(title: String, isDebuggable: Bool, doneBy: String? = nil) {
//        self.title = title
//        self.isDebuggable = isDebuggable
//        self.doneBy = doneBy
//    }
//    func performTask() {
//        print("Performing Coding Task: \(self.title). Debuggable: \(self.isDebuggable), Done by: \(self.doneBy ?? "N/A")")
//    }
//}
//class MeetingTask: Task, SchedulableMeeting{
//    var title: String
//    var isSchedulable: Bool = false
//    var meetingTime: String?
//    init(title: String, meetingTime: String? = nil) {
//        self.title = title
//        self.meetingTime = meetingTime
//    }
//    func performTask() {
//        print("Scheduling Meeting: \(self.title) at \(self.meetingTime ?? "TBD")")
//    }
//}
//class TaskManager{
//    private var task: Task
//    init(task: Task) {
//        self.task = task
//    }
//    func performTask() {
//        task.performTask()
//    }
//}
//
//let codingTask = CodingTask(title: "Refactor Code", isDebuggable: true, doneBy: "02/23/2025")
//let meetingTask = MeetingTask(title: "Project Kickoff", meetingTime: "10:30 AM")
//
//let codingTaskManager = TaskManager(task: codingTask)
//let meetingTaskManager = TaskManager(task: meetingTask)
//
//// Executing tasks
//codingTaskManager.performTask()
//meetingTaskManager.performTask()
