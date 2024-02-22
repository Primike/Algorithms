// You are given a sorted list of disjoint intervals intervals 
// representing a set of real numbers as described above, 
// where intervals[i] = [ai, bi] represents the interval [ai, bi). 
// You are also given another interval toBeRemoved.
// Return the set of real numbers with the interval 
// toBeRemoved removed from intervals. 

// Time: O(n), Space: O(1)
func removeInterval(_ intervals: [[Int]], _ toBeRemoved: [Int]) -> [[Int]] {
    var result = [[Int]]()

    for interval in intervals {
        if interval[1] <= toBeRemoved[0] || interval[0] >= toBeRemoved[1] {
            result.append(interval)
        } else {
            if interval[0] < toBeRemoved[0] { result.append([interval[0], toBeRemoved[0]]) }
            if interval[1] > toBeRemoved[1] { result.append([toBeRemoved[1], interval[1]]) }
        }
    }

    return result
}

print(removeInterval([[0,2],[3,4],[5,7]], [1,6]))
print(removeInterval([[0,5]], [2,3]))
print(removeInterval([[-5,-4],[-3,-2],[1,2],[3,5],[8,9]], [-1,4]))