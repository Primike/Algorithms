// You are given an integer array heights representing the heights 
// of buildings, some bricks, and some ladders.
// If the current building's height is greater than or equal to the 
// next building's height, you do not need a ladder or bricks.
// If the current building's height is less than the next building's height, 
// you can either use one ladder or (h[i+1] - h[i]) bricks.
// Return the furthest building index (0-indexed) you can reach 
// if you use the given ladders and bricks optimally.

// Time: O(n * logn), Space: O(n)
func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
    var heap = Heap<Int>(.maxHeap)
    var ladders = ladders, bricks = bricks

    for i in 1..<heights.count {  
        let difference = heights[i] - heights[i - 1]
        if difference <= 0 { continue }

        heap.push(difference)
        bricks -= difference

        if bricks < 0, !heap.isEmpty {
            if ladders == 0 { return i - 1 }

            bricks += heap.pop()!
            ladders -= 1
        }           
    }

    return heights.count - 1
}

print(furthestBuilding([4,2,7,6,9,14,12], 5, 1))
print(furthestBuilding([4,12,2,7,3,18,20,3,19], 10, 2))
print(furthestBuilding([14,3,19,3], 17, 0))