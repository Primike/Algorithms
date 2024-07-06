// Boxes are put into the warehouse by the following rules:
// Boxes cannot be stacked.
// You can rearrange the insertion order of the boxes.
// Boxes can be pushed into the warehouse from either side (left or right)
// If the height of some room in the warehouse is less than the height of a box, 
// then that box and all other boxes behind it will be stopped before that room.
// Return the maximum number of boxes you can put into the warehouse.

// Time: O(n * log(n)), Space: O(1)
func maxBoxesInWarehouse(_ boxes: [Int], _ warehouse: [Int]) -> Int {
    let boxes = boxes.sorted(by: >)
    var result = 0
    var left = 0, right = warehouse.count - 1
    var i = 0

    while left <= right, i < boxes.count {
        if boxes[i] <= warehouse[left] {
            result += 1
            left += 1
        } else if boxes[i] <= warehouse[right] {
            result += 1
            right -= 1
        }

        i += 1
    }

    return result
}

print(maxBoxesInWarehouse([1,2,2,3,4], [3,4,1,2]))
print(maxBoxesInWarehouse([3,5,5,2], [2,1,3,4,5]))