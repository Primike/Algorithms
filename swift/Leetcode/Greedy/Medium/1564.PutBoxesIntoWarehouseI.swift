// Boxes are put into the warehouse by the following rules:
// Boxes cannot be stacked.
// You can rearrange the insertion order of the boxes.
// Boxes can only be pushed into the warehouse from left to right only.
// If the height of some room in the warehouse is less than the height of a box, 
// then that box and all other boxes behind it will be stopped before that room.
// Return the maximum number of boxes you can put into the warehouse.

// Time: O(n * log(n)), Space: O(1)
func maxBoxesInWarehouse(_ boxes: [Int], _ warehouse: [Int]) -> Int {
    let boxes = boxes.sorted { $0 > $1 }
    var result = 0
    var i = 0

    for height in warehouse {
        while i < boxes.count, boxes[i] > height {
            i += 1
        }

        if i == boxes.count { return result }

        result += 1
        i += 1
    }

    return result
}

print(maxBoxesInWarehouse([4,3,4,1], [5,3,3,4,1]))
print(maxBoxesInWarehouse([1,2,2,3,4], [3,4,1,2]))
print(maxBoxesInWarehouse([1,2,3], [1,2,3,4]))


func maxBoxesInWarehouse2(_ boxes: [Int], _ warehouse: [Int]) -> Int {
    let boxes = boxes.sorted()
    var warehouse = warehouse

    for i in 1..<warehouse.count {
        warehouse[i] = min(warehouse[i], warehouse[i - 1])
    }

    var minimum = Int.max
    var i = 0

    for space in warehouse.reversed() {            
        if i == boxes.count { return i }
        if boxes[i] <= space, boxes[i] <= minimum { i += 1 }
    }

    return i
}