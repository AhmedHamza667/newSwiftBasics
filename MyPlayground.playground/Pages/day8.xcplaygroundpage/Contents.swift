//: [Previous](@previous)

import Foundation

// multithreading - doing multiple tasks at the same time
// 1 - GCD - Grand Central Dispatch
// 2 - operation queue
// 3 - async await (Swift concurancy) 'new'
// 4 - Thread/NSThread
// 5 - DispatchGroups
// 6 - Seamaphores
// 7 - DispatchBarier
// 8 - Actors 'new'
//let thread = Thread{
//    print("Doing some work")
//}
//thread.start()

// GCD - FIFO it uses threads as basic building block
// Tasks are added in a queue and GCD picks the oldest task and execute first then goes to next task
// GCD has 3 types of queues
// 1. main queue (anything related to ui) (loading imgs on UI, adding animations, notifications, data fetching)
// 2. seriel queue (custom queue) for us to create our own queue
// 3. global queue concurrent queues given by OS and are shared by system

// main queue
//DispatchQueue.main.async{
//    print("This code will be excuted on main thread")
//    // ex: tableview.reloadDate()
//    // self.label.text = "New text"
//}
//
//func loadImgURL(_ url: URL){
//    DispatchQueue.global().async{
//        if let data = Data(contentsOf: url), let image = UIImage(data: data){
//            DispatchQueue.main.async{ // because its ui related
//                self.imageView.image = image
//            }
//        }
//    }
//    
//}

//seriel queue (custom queue) for us to create our own queue
//executes one task at a time in the order they are added
//let myQueue = DispatchQueue(label: ".com.ba.accessSpecifer.myQueue")
////add task
//myQueue.async{
//    print("Task 1 started")
//    print("Task 1 in progress")
//    print("Task 1 finished")
//}
//
//myQueue.async{
//    print("Task 2 started")
//    print("Task 2 in progress")
//    print("Task 2 finished")
//}

// comcurrent queue
// can excute multiple tasks simultansuly but it will NOT follow the order they are added
// (attributes: .concurrent) is the diffrence between seriel and concurrent
let comcurrentQueue = DispatchQueue(label: ".com.ba.accessSpecifer.comcurrentQueue", attributes: .concurrent)
comcurrentQueue.async{
    print("Task 1 started")
    for i in 0...10{
        print(i)
    }
    print("Task 1 finished")
}


comcurrentQueue.async{
    print("Task 2 started")
    for i in 20...30{
        print(i)
    }
    print("Task 2 finished")
}

comcurrentQueue.async{
    print("Task 3 started")
    for i in 40...50{
        print(i)
    }
    print("Task 3 finished")
}

