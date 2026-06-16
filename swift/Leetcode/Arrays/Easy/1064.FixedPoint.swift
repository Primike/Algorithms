// Given an array of distinct integers arr, 
// where arr is sorted in ascending order, 
// return the smallest index i that satisfies arr[i] == i. 
// If there is no such index, return -1.

// Time: O(n), Space: O(1)
func fixedPoint(_ arr: [Int]) -> Int {
    for i in 0..<arr.count {
        if i == arr[i] { return i }
    }

    return -1
}

print(fixedPoint([-10,-5,0,3,7]))
print(fixedPoint([0,2,5,8,17]))
print(fixedPoint([-10,-5,3,4,7,9]))