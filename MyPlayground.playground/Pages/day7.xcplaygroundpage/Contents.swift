//: [Previous](@previous)

import Foundation
// dependacy injection - when a class needs to preforn a functionality, we pass it from outside instead hard coding it
// construction injection
// property injection
// method injection
//class WebServiceManager  {
//    init(){
//        print("Init for WebServiceManager")
//    }
//    func doAPICall(urlString: String) {
//        print("Api call in progress")
//        print(urlString)
//    }
//    deinit{
//        print("deinit for WebServiceManager")
//    }
//}

//class ViewController {
//    let webServiceManage : WebServiceManager
//    var apiString : String?
//    
//    init(webServiceManage: WebServiceManager) {
//        self.webServiceManage = webServiceManage
//        print("Init for ViewController")
//    }
//    func submitBtn(){
//        webServiceManage.doAPICall(urlString: self.apiString ?? "")
//    }
//    func anotherSubmitBtn(urlString: String, productId: String){
//        webServiceManage.doAPICall(urlString: urlString + "?productId=" + productId)
//    }
//    deinit{
//        print("deinit for ViewController")
//    }


//}
////construction injection
//var v1:ViewController? = ViewController(webServiceManage: WebServiceManager()) // both initalized here
//v1?.apiString = "https://google.com" // property injection
//v1?.submitBtn()
//v1?.anotherSubmitBtn(urlString: "https://yahoo.com", productId: "21") // method injection
//v1?.anotherSubmitBtn(urlString: "https://facebook.com", productId: "221") // method injection
//v1 = nil // both deinit because it's one way relationship


// dependency inversion - injecting your dependency using protocol
// 1. construction injection
// 2. property injection
// 3. method injection
protocol DBoperation{
    func saveData()
}

class DatabaseManager: DBoperation{
    func saveData(){
        print("Data saved to database")
    }
}
class ViewController{
    let dbManager: DBoperation
    init(dbManager: DBoperation) { // construction injection using protocol
        self.dbManager = dbManager
    }
    func saveValuesInDatabase(){
        dbManager.saveData()
    }
}
let v1 = ViewController(dbManager: DatabaseManager())
v1.saveValuesInDatabase()

class FireBaseManager: DBoperation{
    func saveData() {
        print("Data saved to firebase")
    }
}

let v2 = ViewController(dbManager: FireBaseManager())
v2.saveValuesInDatabase()

