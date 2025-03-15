// The characters 'W' and 'B' denote the colors white and black, respectively.
// You are also given an integer k, which is the desired number 
// of consecutive black blocks.
// In one operation, you can recolor a white block 
// such that it becomes a black block.
// Return the minimum number of operations needed 
// such that there is at least one occurrence of k consecutive black blocks.

// Time: O(n), Space: O(1)
func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
    let blocks = Array(blocks)
    var result = Int.max
    var left = 0
    var white = 0

    for i in 0..<blocks.count {
        white += blocks[i] == "W" ? 1 : 0
        if i - left + 1 < k { continue }

        result = min(result, white)
        white -= blocks[left] == "W" ? 1 : 0
        left += 1
    }

    return result
}

print(minimumRecolors("WBBWWBBWBW", 7))
print(minimumRecolors("WBWBBBW", 2))