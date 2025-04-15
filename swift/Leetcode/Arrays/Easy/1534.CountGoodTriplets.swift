// Given an array of integers arr, and three integers a, b and c. 
// You need to find the number of good triplets.
// A triplet (arr[i], arr[j], arr[k]) is good 
// if the following conditions are true:
// 0 <= i < j < k < arr.length
// |arr[i] - arr[j]| <= a
// |arr[j] - arr[k]| <= b
// |arr[i] - arr[k]| <= c
// Where |x| denotes the absolute value of x.
// Return the number of good triplets.

// Time: O(n^3), Space: O(1)
func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
    var result = 0

    for i in 0..<(arr.count - 2) {
        for j in (i + 1)..<(arr.count - 1) {
            if abs(arr[i] - arr[j]) > a { continue }

            for k in (j + 1)..<(arr.count) {
                if abs(arr[j] - arr[k]) > b { continue }
                if abs(arr[i] - arr[k]) > c { continue }

                result += 1
            }
        }
    }

    return result
}

print(countGoodTriplets([3,0,1,1,9,7], 7, 2, 3))
print(countGoodTriplets([1,1,2,2,3], 0, 0, 1))