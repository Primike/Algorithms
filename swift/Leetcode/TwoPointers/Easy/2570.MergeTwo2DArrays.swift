// nums1[i] = [idi, vali] indicate that the number 
// with the id idi has a value equal to vali.
// nums2[i] = [idi, vali] indicate that the number 
// with the id idi has a value equal to vali.
// Each array contains unique ids and is sorted in ascending order by id.
// Merge the two arrays into one array that is sorted 
// in ascending order by id, respecting the following conditions:
// Only ids that appear in at least one of the two arrays 
// should be included in the resulting array.
// Each id should be included only once and its value should be 
// the sum of the values of this id in the two arrays. 
// If the id does not exist in one of the two arrays, 
// then assume its value in that array to be 0.
// Return the resulting array. 
// The returned array must be sorted in ascending order by id.

// Time: O(n), Space: O(1)
func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
    let length1 = nums1.count, length2 = nums2.count
    var result = [[Int]]()
    var i = 0, j = 0

    while i < length1 || j < length2 {
        if i < length1, j < length2, nums1[i][0] == nums2[j][0] {
            result.append([nums1[i][0], nums1[i][1] + nums2[j][1]])
            i += 1
            j += 1
        } else if i >= length1 || (j < length2 && nums1[i][0] > nums2[j][0]) {
            result.append(nums2[j])
            j += 1
        } else {
            result.append(nums1[i])
            i += 1
        }
    }

    return result
}

print(mergeArrays([[1,2],[2,3],[4,5]], [[1,4],[3,2],[4,1]]))
print(mergeArrays([[2,4],[3,6],[5,5]], [[1,3],[4,3]]))