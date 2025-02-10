//: [Previous](@previous)

import Foundation

class TrapGrid {
    var numOfRows: Int
    var numOfCols: Int
        init(numOfRows: Int, numOfCols: Int) {
        self.numOfRows = numOfRows
        self.numOfCols = numOfCols
        self.boxes = Array(repeating: Array(repeating: "🟢", count: numOfCols), count: numOfRows)
    }
    var boxes: [[Character]]
    var totalBoxesNum: Int {
        self.numOfCols * self.numOfRows
    }
    var unSafeBoxes: Int {
        totalBoxesNum / 4
    }
    func fillBoxes() {
        var remainingUnsafeBoxes = unSafeBoxes
        while remainingUnsafeBoxes > 0{
            var i = Int.random(in: 0 ..< numOfRows)
            var j = Int.random(in: 0 ..< numOfCols)
            if boxes[i][j] == "🟢" { // to prevent getting the same number
                boxes[i][j] = "🔴"
                remainingUnsafeBoxes -= 1
            }
        }
    }
    func displayBoxes() {
        for i in 0..<numOfRows {
            for j in 0..<numOfCols {
                print(boxes[i][j], terminator: " ")
            }
            print()
        }
    }
}
var game1 = TrapGrid(numOfRows: 5, numOfCols: 8)
game1.displayBoxes()
game1.fillBoxes()
print("=========================")
game1.displayBoxes()

