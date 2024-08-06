// You are given two integer arrays of equal length target and arr. 
// In one step, you can select any non-empty subarray of arr and reverse it. 
// You are allowed to make any number of steps.
// Return true if you can make arr equal to target or false otherwise.

// Time: O(n), Space: O(n)
func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
    return target.reduce(into: [:]) { $0[$1, default: 0] += 1 } == arr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
}

print(canBeEqual([1,2,3,4], [2,4,1,3]))
print(canBeEqual([7], [7]))
print(canBeEqual([3,7,9], [3,7,11]))