//: [Previous](@previous)

import Foundation

// GCD - main queue
//DispatchQueue.main.async(){
//    print("Fetching user data...")
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//        print("User data fetched after 2 seconds.")
//        print("User data received: Name: Alice, Age: 25")
//    }
//}

// Serial and Concurrent Queue
// seriel will excute in order

//let bankTeller = DispatchQueue(label: ".com.ah.somename.bankTeller")
//bankTeller.async {
//    print("Started processing a transaction for customer 1")
//    sleep(1)
//    print("Customer 1 transaction completed")
//}
//bankTeller.async {
//    print("Started processing a transaction for customer 2")
//    sleep(1)
//    print("Customer 2 transaction completed")
//}
//bankTeller.async {
//    print("Started processing a transaction for customer 3")
//    sleep(1)
//    print("Customer 3 transaction completed")
//}

// Concurrent Allows multiple tasks to execute in parallel
//let concurrentBankTeller = DispatchQueue(label: ".com.ah.somename.concurrentBankTeller", attributes: .concurrent)
//concurrentBankTeller.async { // change to async
//    print("Started processing a transaction for customer 1")
//    sleep(1)
//    print("Customer 1 transaction completed")
//}
//
//concurrentBankTeller.async {
//    print("Started processing a transaction for customer 2")
//    sleep(1)
//    print("Customer 2 transaction completed")
//}
//
//concurrentBankTeller.async {
//    print("Started processing a transaction for customer 3")
//    sleep(1)
//    print("Customer 3 transaction completed")
//}

// Golbal Queue
//func downloadFiles(fileId: Int) {
//    var downloadingTime = Int.random(in: 1...3)
//    print("Downloading file \(fileId) and will take \(downloadingTime) seconds")
//    sleep(UInt32(downloadingTime))
//    DispatchQueue.main.async {
//        print("File \(fileId) has been downloaded successfully")
//    }
//}
//
//for i in 1...5 {
//    DispatchQueue.global(qos: .background).async {
//        downloadFiles(fileId: i)
//    }
//
//}

// Operation queues
//let downloadImage1 = BlockOperation{
//    print("Downloading image 1...")
//    sleep(1)
//    print("Image 1 downloaded. now applying filters...")
//}
//let downloadImage2 = BlockOperation{
//    print("Downloading image 2...")
//    sleep(2)
//    print("Image 2 downloaded. now applying filters...")
//}
//let downloadImage3 = BlockOperation{
//    print("Downloading image 3...")
//    sleep(3)
//    print("Image 3 downloaded. now applying filters...")
//}
//
//let applyFilters1 = BlockOperation{
//    print("Applying filters for image 1...")
//    sleep(1)
//    print("Filters applied for image 1.")
//}
//let applyFilters2 = BlockOperation{
//    print("Applying filters for image 2...")
//    sleep(2)
//    print("Filters applied for image 2.")
//}
//let applyFilters3 = BlockOperation{
//    print("Applying filters for image 3...")
//    sleep(3)
//    print("Filters applied for image 3.")
//}
//
//
//let imageProcessor = OperationQueue()
//imageProcessor.maxConcurrentOperationCount = 2 // set max concurrency to 2
//// filters can't be applied before downloading
//applyFilters1.addDependency(downloadImage1)
//applyFilters2.addDependency(downloadImage2)
//applyFilters3.addDependency(downloadImage3)
//
//imageProcessor.addOperations([downloadImage1, downloadImage2, downloadImage3, applyFilters1, applyFilters2, applyFilters3], waitUntilFinished: false)
//
//let completionOperation = BlockOperation {
//    DispatchQueue.main.async {
//        print("All images are processed!")
//    }
//}
//completionOperation.addDependency(applyFilters1) // dependant on all 3
//completionOperation.addDependency(applyFilters2)
//completionOperation.addDependency(applyFilters3)
//
//imageProcessor.addOperation(completionOperation)


// Dispatch Groups

//let dispatchGroup = DispatchGroup()
//
//dispatchGroup.enter()
//print("Fetching data from API 1")
//sleep(2)
//print("Data recived from API 1")
//dispatchGroup.leave()
//
//dispatchGroup.enter()
//print("Fetching data from API 2")
//sleep(2)
//print("Data recived from API 2")
//dispatchGroup.leave()
//
//dispatchGroup.enter()
//print("Fetching data from API 3")
//sleep(2)
//print("Data recived from API 3")
//dispatchGroup.leave()
//
//dispatchGroup.notify(queue: DispatchQueue.main) {
//    print("All API data has been fetched.")
//}

