//import Foundation
//
//// Vehicle types
//enum VehicleType {
//    case car
//    case motorcycle
//    case van
//}
//
//// Parking lot protocol
//protocol Lot {
//    var totalSpots: Int { get }
//    func isFull() -> Bool
//    func isEmpty() -> Bool
//    func remainingSpots() -> Int
//    func addVehicle(vehicleType: VehicleType) -> Bool
//    func removeVehicle(vehicleType: VehicleType) -> Bool
//    func clearLot()
//    func spotsTakenByVans() -> Int
//}
//
//// Parking lot class
//class ParkingLot: Lot {
//    var motorcycleSpots: Int
//    var carSpots: Int
//    var largeSpots: Int
//
//    var usedMotorcycleSpots: Int = 0
//    var usedCarSpots: Int = 0
//    var usedLargeSpots: Int = 0
//
//    init(motorcycleSpots: Int, carSpots: Int, largeSpots: Int) {
//        self.motorcycleSpots = motorcycleSpots
//        self.carSpots = carSpots
//        self.largeSpots = largeSpots
//    }
//
//    var totalSpots: Int {
//        return motorcycleSpots + carSpots + largeSpots
//    }
//
//    func isFull() -> Bool {
//        return usedMotorcycleSpots == motorcycleSpots &&
//               usedCarSpots == carSpots &&
//               usedLargeSpots == largeSpots
//    }
//
//    func isEmpty() -> Bool {
//        return usedMotorcycleSpots == 0 && usedCarSpots == 0 && usedLargeSpots == 0
//    }
//
//    func remainingSpots() -> Int {
//        return (motorcycleSpots - usedMotorcycleSpots) +
//               (carSpots - usedCarSpots) +
//               (largeSpots - usedLargeSpots)
//    }
//
//    func addVehicle(vehicleType: VehicleType) -> Bool {
//        switch vehicleType {
//        case .motorcycle:
//            if usedMotorcycleSpots < motorcycleSpots {
//                usedMotorcycleSpots += 1
//            } else if usedCarSpots < carSpots {
//                usedCarSpots += 1
//            } else if usedLargeSpots < largeSpots {
//                usedLargeSpots += 1
//            } else {
//                print("No available spot for a motorcycle.")
//                return false
//            }
//            print("Motorcycle parked successfully.")
//            return true
//
//        case .car:
//            if usedCarSpots < carSpots {
//                usedCarSpots += 1
//                print("Car parked successfully.")
//                return true
//            }
//            else if usedLargeSpots < largeSpots {
//                    usedLargeSpots += 1
//                    print("Car parked successfully.")
//                    return true
//                }
//            print("No available car spot.")
//            return false
//
//        case .van:
//            if usedLargeSpots < largeSpots {
//                usedLargeSpots += 1
//                print("Van parked successfully, using 1 large spot.")
//                return true
//            }
//            if usedCarSpots + 3 <= carSpots {
//                usedCarSpots += 3
//                print("Van parked successfully, using 3 car spots.")
//                return true
//            }
//            print("Not enough regular spots for a van.")
//            return false
//        }
//    }
//
//    func removeVehicle(vehicleType: VehicleType) -> Bool {
//        switch vehicleType {
//        case .motorcycle:
//            if usedMotorcycleSpots > 0 {
//                usedMotorcycleSpots -= 1
//            } else if usedCarSpots > 0 {
//                usedCarSpots -= 1
//            } else if usedLargeSpots > 0 {
//                usedLargeSpots -= 1
//            } else {
//                print("No motorcycles to remove.")
//                return false
//            }
//            print("Motorcycle removed successfully.")
//            return true
//
//        case .car:
//            if usedCarSpots > 0 {
//                usedCarSpots -= 1
//                print("Car removed successfully.")
//                return true
//            }
//            print("No cars to remove.")
//            return false
//
//        case .van:
//            if usedLargeSpots > 0 {
//                usedLargeSpots -= 1
//                print("Van removed successfully.")
//                return true
//            }
//            print("No vans to remove.")
//            return false
//        }
//    }
//
//    func clearLot() {
//        usedMotorcycleSpots = 0
//        usedCarSpots = 0
//        usedLargeSpots = 0
//        print("Parking lot cleared.")
//    }
//
//    func spotsTakenByVans() -> Int {
//        return usedCarSpots / 3
//    }
//}
//
//// Example Usage
//var parkingLot = ParkingLot(motorcycleSpots: 2, carSpots: 6, largeSpots: 2)
//
//parkingLot.addVehicle(vehicleType: .motorcycle)  // Motorcycle parked
//parkingLot.addVehicle(vehicleType: .car)         // Car parked
//parkingLot.addVehicle(vehicleType: .van)         // Van parked (3 car spots)
//parkingLot.addVehicle(vehicleType: .van)         // Van cannot park (not enough space)
//
//print("Total spots:", parkingLot.totalSpots)
//print("Remaining spots:", parkingLot.remainingSpots())
//print("Vans are using \(parkingLot.spotsTakenByVans()) spots.")
//
//parkingLot.removeVehicle(vehicleType: .van)      // Van removed
//print("Remaining spots after removing van:", parkingLot.remainingSpots())
//
