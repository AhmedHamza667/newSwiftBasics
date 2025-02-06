//: [Previous](@previous)

import Foundation
// Copy on write (COW)- a memory optmization technique by swift to save memory, until you modify a copied element it refares to the same internal memory location
func printAddr(address o: UnsafeRawPointer ) {
    print(String(format: "%p", Int(bitPattern: o)))
}

//var array1: [Int] = [0, 1, 2, 3]
//var array2 = array1
//print("Original addresses:")
//printAddr(address: array1)
//printAddr(address: array2)
//array2.append(4)  // new address gets allocated here
//print("New addresses:")
//printAddr(address: array1)
//printAddr(address: array2)
//class People{
//    var personList: [String] = []
//    init(personList: [String]) {
//        self.personList = personList
//        print("Memory is allocated")
//    }
//    deinit {
//        print("Memory is released")
//    }
//}
//var list1: People? = People(personList: ["Ahmed", "Alex", "Matthew"])
//var list2 = list1 // Both list1 and list2 reference the same object
//print(list1?.personList)
//print(list2?.personList)
//
//list1?.personList.append("New name") // Changes affect both references
//print(list1?.personList)
//print(list2?.personList)
//list1 = nil // Memory not released yet
//list2 = nil // deinit gets called here

// Strong, weak, unowned, weak self for closure
//class Person{
//    var name:String
//    var pet:Animal?
//    init(name: String, pet: Animal? = nil) {
//        self.name = name
//        self.pet = pet
//        print("Person initialized")
//    }
//    deinit {
//        print("Person deinitialized")
//    }
//}
//class Animal{
//    var name:String
//    weak var owner:Person?
//    init(name: String, owner: Person? = nil) {
//        self.name = name
//        self.owner = owner
//        print("Animal initialized")
//    }
//    deinit {
//        print("Animal deinitialized")
//    }
//}
//var person1:Person? = Person(name: "Ahmed") // init and deinit no problem
//var pet1:Animal? = Animal(name: "Dog")
//person1 = nil
//pet1 = nil

//var person2:Person? = Person(name: "Mark")
//var pet2:Animal? = Animal(name: "cat")
//person2?.pet = pet2 // person2 now has a pet
//pet2?.owner = person2 // pet 2 now has an owner
//person2 = nil  // person 2 will not get deinitalized unless animal has weak var owner
//pet2 = nil

//protocol Storage{
//    associatedtype ItemType
//    var items: [ItemType] {get set}
//    mutating func store(_ item: ItemType)
//    mutating func remove() -> ItemType?
//    func listItems()
//}
//extension Storage{ // function implementation
//    mutating func store(_ item: ItemType) {
//        items.append(item)
//    }
//    mutating func remove() -> ItemType? {
//        guard !items.isEmpty else { return nil }
//        return items.removeLast()
//    }
//    func listItems() {
//        print("Stored items \(items)")
//    }
//}
//class Books: Storage{
//    typealias ItemType = String
//    var items: [ItemType] = []
//}
//class Numbers: Storage{
//    typealias ItemType = Int
//    var items: [ItemType] = []
//}
//var books = Books()
//books.store("The Alchemist")
//books.store("To Kill a Mockingbird")
//books.store("The Great Gatsby")
//books.listItems()
//
//var numbers = Numbers()
//numbers.store(1)
//numbers.store(100)
//numbers.store(1000)
//numbers.remove()
//numbers.listItems()




