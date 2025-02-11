//: [Previous](@previous)

import Foundation

// await async - availbe from ios 13 onwards
// any function you mark as async, gets excuted in a background thread
// use await keyword to call
/*
Rules:
1. synchronous functions cannot simply call async function directly
2. async func can call other async and regular func
*/
// Task group - allow us to excute multiple concurrent tasks and await for the result can be processed parrally

//func getApiData() async{
//    print("logic to fetch data from api")
//    sleep(4) // everything stops until the function finishes
//}
//
//Task{ // in playground task block supports async calls 
//    await getApiData()
//    print("Api call completed")
//}
//
//func doSomeCalc(){ // not working you should wrap in Task {}
//    Task{
//        await getApiData()
//    }
//}
//doSomeCalc()


/*
 Study this!!!
 TaskGroup- This allows us to execute multiple concurrent tasks and await for there results.useful for performing multiple indepdenact tasks that can be procssed parallelly
 */

//func gettingDataFromAPI(url:String) async -> String{
//    
//    try? await Task.sleep(for: .seconds(2))
//    return "Data from \(url)"
//}
//
//func fetchDataFromMultipleAPi() async{
//    
//    await withTaskGroup(of:String.self) { group in
//        
//        let apis = ["https://example.com/ap1","https://example.com/ap2","https://example.com/ap3","https://example.com/ap4"]
//        
//        for url in apis{
//            group.addTask{
//                await gettingDataFromAPI(url: url)
//            }
//        }
//        var outputsArray:[String] = []
//        
//        for await result in group{
//            outputsArray.append(result)
//        }
//        
//        print("Final data for all api cals ")
//        outputsArray.forEach{print($0)}
//    }
//}
//Task{
// //   await fetchDataFromMultipleAPi()
//}
//
//
//func easyTaskGroup() async{
//    
//    await withTaskGroup(of:String.self) { group in
//        group.addTask { "Task 1" }
//        group.addTask { "Task 2" }
//        group.addTask { "Task 3" }
//        group.addTask { "Task 4" }
//        
//        for await result in group{
//          print(result)
//        }
//    }
//}
//Task{
//    await easyTaskGroup()
//}


// race condition - when 2 or more threads access the same shared resource, can lead to unwanted behavior or corrupt data
// like multiple threads modifying the same varible or cuncurrent access to same resource


// actors, same as classes but allows access to vars one at a time, provides thread safety but doesn't support inheartence (prevents data race conditions)
// by default supports async await concurrency

//actor bankAccount{
//    var balance:Double = 0
//    
//    func deposit(_ amount:Double){
//        balance += amount
//        print("Deposited amount: \(amount), new balance: \(balance)")
//    }
//    
//    func withdraw(_ amount:Double){
//        balance -= amount
//        print("Withdrawn amount: \(amount), new balance: \(balance)")
//
//    }
//}
//
//
//func easyTaskGroup() async{
//    let b1 = bankAccount()
//    await withTaskGroup(of:Void.self) { group in
//        group.addTask { await b1.deposit(100) }
//        group.addTask { await b1.deposit(200) }
//        group.addTask { await b1.withdraw(300) }
//        group.addTask { await b1.deposit(50) }
//        //await group.waitForAll()
//
//    }
//    print("All bank operation excuted")
//}
//Task{
//    await easyTaskGroup()
//}
//
//
//// use lock/unlock or semaphore
//
//
//class bankAccount{
//    let semaphore = DispatchSemaphore(value: 1) // allows one task at a time
//    let myLock = NSLock()
//    var balance:Double = 0
//    
//    func deposit(_ amount:Double){
//        myLock.lock()
//        balance += amount
//        myLock.unlock()
//        print("Deposited amount: \(amount), new balance: \(balance)")
//    }
//    
//    func withdraw(_ amount:Double){
//        semaphore.wait()
//        balance -= amount
//        print("Withdrawn amount: \(amount), new balance: \(balance)")
//        semaphore.signal()
//    }
//}
//

// deadlock - this occures when two or more threads are blocked forever because they are each waiting for resourses that other thread holds
// it's a circular dependency amoung threads will make the app freeze or preformance issue or crash

//let queue1 = DispatchQueue(label: "Queue 1")
//let queue2 = DispatchQueue(label: "Queue 2")
//queue1.async {
//    print("Task 1 started")
//    queue2.sync {
//        print("Task 2 started")
//    }
//    print("Task 1 finished")
//}
//
//
//queue2.async {
//    print("Task 2 started")
//    queue1.sync {
//        print("Task 1 started")
//    }
//    print("Task 2 finished")
//}


// DispatchBarier - used to manage concurrent read write operations on shared resourses
// fix the following
class Database: @unchecked Sendable{
    private var records = [String]()
    private var concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    func readRecords(taskNumber: Int) -> String{
        concurrentQueue.async { [weak self] in
            if taskNumber < records.count{
                print("Getting record: \(self.records[taskNumber])")
                return self?.records[taskNumber] ?? 0
            }
        }
        return ""
    }
    func saveRecords(_ newRecords:String){
        concurrentQueue.async(flags: .barrier){ [weak self] in
            self?.records.append(newRecords) ?? 0
            print("New record got added: \(newRecords)")
        }
    }
}

let db = Database()
for i in 0..<15{
    db.saveRecords("Record \(i)")
}

for i in 0..<15{
    db.readRecords(taskNumber: i)
}
