//: [Previous](@previous)

import Foundation
import UIKit
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
//let comcurrentQueue = DispatchQueue(label: ".com.ba.accessSpecifer.comcurrentQueue", attributes: .concurrent)
//comcurrentQueue.async{
//    print("Task 1 started")
//    for i in 0...10{
//        print(i)
//    }
//    print("Task 1 finished")
//}
//
//
//comcurrentQueue.async{
//    print("Task 2 started")
//    for i in 20...30{
//        print(i)
//    }
//    print("Task 2 finished")
//}
//
//comcurrentQueue.async{
//    print("Task 3 started")
//    for i in 40...50{
//        print(i)
//    }
//    print("Task 3 finished")
//}

// global queues - system provided concurrent queue
// it has diffrent quality of service (QoS)

// QoS - ordered by piority
/*
1. UserInteractive - used for animations for any kind of user animated job to be done that involves updating UI for tasks that interact with user and require immidate results ex: UI update
2. UserInitiated - a task when user needs immediate results, ex: rolling a list of data, paginantion, pull to refresh
3. Utility - long running task, downloading a file or doc, which user is aware of this task and not high piority
4. Background - something that is not visible to user, ex: creating backups, restoring data from server, or syncing local data, any task which user should not be aware of
5. Default - this one falls between UserInteractive and Utility
6. Unspecified - tasks that are good to have functionality has the least piority
 */
//DispatchQueue.global().async{
//    for i in 0...10{
//        print(i)
//    }
//}
//
//DispatchQueue.global(qos: .userInteractive).async{
//    print("Any UI animations or user UI update related job")
//}
//
//DispatchQueue.global(qos: .userInitiated).async{
//    print("Fetching data on scroll")
//    DispatchQueue.main.async{
//        print("Reloading the list")
//    }
//}
//
//func downloadFile(from url: URL){
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if let error = error{
//            print("Error downloading file: \(error)")
//            return
//        }
//        print("File has been downloaded successfully")
//    }
//    task.resume()
//}
//if let url = URL(string: "https://www.facebook.com"){
//    DispatchQueue.global(qos: .utility).async{
//        downloadFile(from: url)
//        DispatchQueue.main.async{
//            print("Showing popup download complete")
//        }
//
//    }
//}
//DispatchQueue.global(qos: .default).async{
//    print("Default piority")
//}
//
//DispatchQueue.global(qos: .background).async{
//    print("Whatsapp background syncing")
//}
//func compressLargeVids(){
//    DispatchQueue.global(qos: .background).async{
//        var videos: [String] = ["url1","url2","url3"]
//        for video in videos{
//            print("Compressed video: \(video)")
//        }
//    }
//}
//
//compressLargeVids()
//
//DispatchQueue.global(qos: .unspecified).async{
//    print("Updating and syncing local files with server")
//}

//// operation queue - wrapper queue built on top of GCD
//// gives you more control like pause resume cancel start operation in queue
//
//// block operation
//let taskToPreform = BlockOperation {
//    print("simple block operation task 1")
//}
//let taskToPreform2 = BlockOperation {
//    print("simple block operation task 2")
//}
//let taskToPreform3 = BlockOperation {
//    print("simple block operation task 3")
//}
//
//
//let op = OperationQueue()
//op.addOperation(taskToPreform)
//op.addOperation(taskToPreform2)
//op.addOperation(taskToPreform3)
//op.addOperation {
//    print("all done")
//}
////op.addOperations([taskToPreform, taskToPreform2, taskToPreform3], waitUntilFinished:false) // other way to call
//
//let prepareLettuce = BlockOperation {
//    print("preparing lettuce")
//}
//let prepareTomato = BlockOperation {
//    print("preparing tomatoe")
//}
//let prepareCheese = BlockOperation {
//    print("preparing cheese")
//}
//
//let saladQueue = OperationQueue()
////saladQueue.maxCurrentOperationCount = 1  // set max
//prepareLettuce.addDependency(prepareCheese) // cheese has to come before lettuce
//saladQueue.addOperations([prepareLettuce, prepareCheese, prepareTomato], waitUntilFinished:false)
//
//class downloadImageOperation: Operation,@unchecked Sendable{
//    private let url: URL
//    var imageData: Data?
//
//    init(url: URL) {
//        self.url = url
//    }
//
//    override func main() {
//        if isCancelled { return }
//        do {
//            imageData = try data(contentsOf: url)
//            image = UIImage(data: data)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//let imageQueue = OperationQueue()
//let operations = [downloadImageOperation(url: URL(string:"https://via.placeholder.com/150")!), downloadImageOperation(url: URL(string:"https://via.placeholder.com/250")!), downloadImageOperation(url: URL(string:"https://via.placeholder.com/350")!)]
//imageQueue.addOperations(operations, waitUntilFinished: false)


// group - used to manage a group of tasks to run
// after running it notifies the other threads
//let group = DispatchGroup()
//group.enter()
//print("Task 1")
//group.leave()
//
//group.enter()
//print("Task 2")
//group.leave()
//
//group.enter()
//print("Task 3")
//group.leave()
//
//
//group.notify(queue: .main) {
//    print("Updating the UI elements")
//}
