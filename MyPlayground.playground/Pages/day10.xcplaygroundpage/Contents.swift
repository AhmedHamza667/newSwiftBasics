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

//func fetchAllUsers() async -> String{
//    print("Fetching user data...")
//    sleep(2)
//    return "User: Ahmed"
//}
//func fetchUserPosts() async -> [String]{
//    print("Fetching user posts...")
//    sleep(2)
//    return ["Post 1: Hello World", "Post 2: Swift is awesome"]
//}
//
//func fetchAllData() async{
//    var user = await fetchAllUsers()
//    var posts = await fetchUserPosts()
//    print("\(user) - \(posts)")
//}
//Task{
//    await fetchAllData()
//}


/*
  TaskGroup- This allows us to execute multiple concurrent tasks and await for their results. useful for performing multiple indepdenact tasks that can be procssed parallelly
 */

//func gettingUserPosts(user:String) async -> String{
//    
//    try? await Task.sleep(for: .seconds(2))
//    return "Posts from \(user)"
//}
//
//func fetchFromMultipleUsers() async{
//    
//    await withTaskGroup(of:String.self) { group in
//        
//        let users = ["Ahmed","Max","Alice","Rubin"]
//        
//        for user in users{
//            group.addTask{
//                await gettingUserPosts(user: user)
//            }
//        }
//        var outputsArray:[String] = []
//        
//        for await posts in group{
//            outputsArray.append(posts)
//        }
//        
//        print("Final data for all users ")
//        outputsArray.forEach{print($0)}
//    }
//}
//Task{
//   await fetchFromMultipleUsers()
//}



// race condition - when 2 or more threads access the same shared resource, can lead to unwanted behavior or corrupt data
// like multiple threads modifying the same varible or cuncurrent access to same resource


// actors, same as classes but allows access to vars one at a time, provides thread safety but doesn't support inheartence (prevents data race conditions)
// by default supports async await concurrency


// solution 1 using seriel queue
//class TicketBooking: @unchecked Sendable {
//    var availableTickets:Int
//    let queue = DispatchQueue(label: "myQueue")
//    init(availableTickets: Int) {
//        self.availableTickets = availableTickets
//    }
//    func bookTicket(amount:Int){
//        queue.async{
//            print("Trying to book \(amount) tickets")
//            if amount > self.availableTickets{
//                print("Sorry, not enough tickets available")
//            }
//            else{
//                self.availableTickets -= amount
//                print("Booked \(amount) tickets, \(self.availableTickets) tickets left")
//            }
//        }
//    }
//}

//var t1 = TicketBooking(availableTickets: 10)
//for _ in 0..<7{
//    Task{
//        var i = Int.random(in: 1...5)
//        t1.bookTicket(amount: i)
//    }
//}

// solution 2 using actor
//actor HotelBooking{
//    var availableRooms:Int
//    init(availableRooms: Int) {
//        self.availableRooms = availableRooms
//    }
//    func bookRoom() {
//        print("Trying to book a room")
//        if availableRooms == 0{
//            print("Sorry, no rooms available")
//        }
//        else{
//            availableRooms -= 1
//            print("Booked a room, \(availableRooms) rooms left")
//        }
//    }
//}
//var hotel1 = HotelBooking(availableRooms: 4)
//for _ in 0..<5{
//    Task{
//        await hotel1.bookRoom()
//    }
//}
// solution 3 using lock or semaphore
//class LeagueTable{
//    private var totalPoints:Int = 0
//    private var myLock = NSLock()
//    //private var semaphore = DispatchSemaphore(value: 1)
//    func won(){
//        myLock.lock()
//        //semaphore.wait()
//        totalPoints += 3
//        print("Won a match, total points: \(totalPoints)")
//        //semaphore.signal()
//        myLock.unlock()
//    }
//    func draw(){
//        myLock.lock()
//        //semaphore.wait()
//        totalPoints += 1
//        print("Draw a match, total points: \(totalPoints)")
//        //semaphore.signal()
//        myLock.unlock()
//    }
//    func lost(){
//        // not needed here
//        print("Lost a match, total points: \(totalPoints)")
//    }
//}
//let league = LeagueTable()
//// simulate concurrent execution
//let queue = DispatchQueue(label: "matchQueue", attributes: .concurrent)
//
//for _ in 0..<5 {
//    queue.async {
//        league.won()
//    }
//    queue.async {
//        league.draw()
//    }
//    queue.async {
//        league.lost()
//    }
//}



// DispatchBarier - used to manage concurrent read write operations on shared resourses
//let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
//
//var dataSize = 0
//
//for _ in 0..<5 {
//    concurrentQueue.async {
//        print("Fetching some old data")
//        dataSize += 1
//        print("Old data fetched data size: \(dataSize)")
//    }
//}
//// Barrier!!! everthing has to be excuted first, blocking other concurrent tasks
//
//concurrentQueue.async(flags: .barrier) {
//    print("Modifying database blocking other concurrent tasks...")
//    dataSize = 100
//    print("Database has been modified, data size: \(dataSize)")
//}
//
//// more tasks after the barrier block
//for _ in 0..<5 {
//    concurrentQueue.async {
//        print("Fetching data after database modification...")
//        dataSize += 1
//        print("New data fetched, shared resource: \(dataSize)")
//    }
//}
