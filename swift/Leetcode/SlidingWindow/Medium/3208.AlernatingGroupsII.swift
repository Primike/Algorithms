// There is a circle of red and blue tiles. 
// You are given an array of integers colors and an integer k. 
// The color of tile i is represented by colors[i]:
// colors[i] == 0 means that tile i is red.
// colors[i] == 1 means that tile i is blue.
// An alternating group is every k contiguous tiles 
// in the circle with alternating colors 
// (each tile in the group except the first and last one 
// has a different color from its left and right tiles).
// Return the number of alternating groups.

// Time: O(n + k), Space: O(1)
func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
    var result = 0
    var count = 1
    var last = colors[0]
    var i = 1
    
    for _ in 1..<(colors.count + k - 1) {
        if colors[i] != last {
            count = min(k, count + 1)
        } else {
            count = 1
        }

        if count == k { result += 1 }
        last = colors[i]
        i = (i + 1) % colors.count
    }

    return result
}

print(numberOfAlternatingGroups([0,1,0,1,0], 3))
print(numberOfAlternatingGroups([0,1,0,0,1,0,1], 6))
print(numberOfAlternatingGroups([1,1,0,1], 4))