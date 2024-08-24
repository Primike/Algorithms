// You are given m arrays, where each array is sorted in ascending order.
// You can pick up two integers from two different arrays 
// (each array picks one) and calculate the distance. 
// We define the distance between two integers a and b 
// to be their absolute difference |a - b|.
// Return the maximum distance.

// Time: O(n), Space: O(1)
func maxDistance(_ arrays: [[Int]]) -> Int {
    var result = Int.min
    var minimum = arrays[0][0]
    var maximum = arrays[0][arrays[0].count - 1]

    for i in 1..<arrays.count {
        result = max(result, abs(maximum - arrays[i][0]))
        result = max(result, abs(arrays[i][arrays[i].count - 1] - minimum))
        minimum = min(minimum, arrays[i][0])
        maximum = max(maximum, arrays[i][arrays[i].count - 1])
    }

    return result
}

print(maxDistance([[1,2,3],[4,5],[1,2,3]]))
print(maxDistance([[1],[1]]))