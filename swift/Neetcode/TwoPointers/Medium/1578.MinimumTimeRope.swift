// Alice wants the rope to be colorful. She does not want two consecutive 
// balloons to be of the same color, so she asks Bob for help. 
// Bob can remove some balloons from the rope to make it colorful. 
// You are given a 0-indexed integer array neededTime where 
// neededTime[i] is the time (in seconds) that Bob needs to 
// remove the ith balloon from the rope.
// Return the minimum time Bob needs to make the rope colorful.

// Time: O(n), Space: O(1)
func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
    let colors = Array(colors)
    var result = 0
    var i = 0

    while i < colors.count {
        let color = colors[i]
        var total = 0, largest = 0

        while i < colors.count, colors[i] == color {
            total += neededTime[i]
            largest = max(largest, neededTime[i])
            i += 1
        }

        result += total - largest
    }

    return result
}

print(minCost("abaac", [1,2,3,4,5]))
print(minCost("abc", [1,2,3]))
print(minCost("aabaa", [1,2,3,4,1]))