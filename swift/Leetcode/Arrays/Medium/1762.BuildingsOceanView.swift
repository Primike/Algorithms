// There are n buildings in a line. You are given an integer array 
// heights of size n that represents the heights of the buildings in the line.
// The ocean is to the right of the buildings. A building has an ocean view 
// if the building can see the ocean without obstructions. 
// Formally, a building has an ocean view if all the buildings to its right 
// have a smaller height.
// Return a list of indices (0-indexed) of buildings that have an ocean view, 
// sorted in increasing order.

// Time: O(n), Space: O(n)
func findBuildings(_ heights: [Int]) -> [Int] {
    var result = [Int]()
    var tallest = 0

    for i in stride(from: heights.count - 1, to: -1, by: -1) {
        if heights[i] > tallest { result.append(i) }

        tallest = max(tallest, heights[i])
    }

    return result.reversed()
}

print(findBuildings([4,2,3,1]))
print(findBuildings([4,3,2,1]))
print(findBuildings([1,3,2,4]))