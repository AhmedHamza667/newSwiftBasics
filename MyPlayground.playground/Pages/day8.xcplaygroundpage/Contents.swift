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
