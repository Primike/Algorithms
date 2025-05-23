// Each encoded[i] = [vali, freqi]
// For example, nums = [1,1,1,2,2,2,2,2] is represented by the 
// run-length encoded array encoded = [[1,3],[2,5]]. 
// Another way to read this is "three 1's followed by five 2's".
// Expand both encoded1 and encoded2 into the full arrays 
// nums1 and nums2 respectively.
// Create a new array prodNums of length nums1.length and 
// set prodNums[i] = nums1[i] * nums2[i].
// Compress prodNums into a run-length encoded array and return it.

// Time: O(n + m), Space: O(1)
func findRLEArray(_ encoded1: [[Int]], _ encoded2: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var i = 0, j = 0
    var iCount = 0
    var jCount = 0

    while i < encoded1.count, j < encoded2.count {
        let number = encoded1[i][0] * encoded2[j][0]
        let minimum = min(encoded1[i][1] - iCount, encoded2[j][1] - jCount)

        if let last = result.last, last[0] == number {
            result[result.count - 1][1] += minimum
        } else {
            result.append([number, minimum])
        }

        iCount += minimum
        jCount += minimum

        if iCount == encoded1[i][1] {
            iCount = 0
            i += 1
        }

        if jCount == encoded2[j][1] {
            jCount = 0
            j += 1
        }
    }

    return result
}

print(findRLEArray([[1,3],[2,3]], [[6,3],[3,3]]))
print(findRLEArray([[1,3],[2,1],[3,2]], [[2,3],[3,3]]))