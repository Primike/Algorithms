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

// Time: O(n + k), Space: O(n + k)
func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
    let circular = colors + Array(colors.prefix(k - 1))
    var result = 0
    var count = 1
    var isZero = circular[0] == 0

    for i in 1..<circular.count {
        let color = circular[i]

        if (isZero && color == 1) || (!isZero && color == 0) {
            count = min(k, count + 1)
        } else {
            count = 1
        }

        isZero = color == 0
        result += count == k ? 1 : 0
    }

    return result
}

print(numberOfAlternatingGroups([0,1,0,1,0], 3))
print(numberOfAlternatingGroups([0,1,0,0,1,0,1], 6))
print(numberOfAlternatingGroups([1,1,0,1], 4))