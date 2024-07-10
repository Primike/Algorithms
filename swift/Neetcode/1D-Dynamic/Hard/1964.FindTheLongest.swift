// Return an array ans of length n, where ans[i] is the length of the 
// longest obstacle course for index i as described above.
// BS Finds position were current is greater than last element in a subsequence
// it will overwrite a larger value and use the smaller as the new last 

// Time: O(n * logn), Space: O(n)
func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
    var tab = Array(repeating: 0, count: obstacles.count)
    var lis = [Int]()

    for (i, obstacle) in obstacles.enumerated() {
        var left = 0, right = lis.count

        while left < right {
            let mid = (right + left) / 2

            if obstacle >= lis[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if left == lis.count {
            lis.append(obstacle)
        } else {
            lis[left] = obstacle
        }

        tab[i] = left + 1
    }

    return tab
}

print(longestObstacleCourseAtEachPosition([1,2,3,2]))
print(longestObstacleCourseAtEachPosition([2,2,1]))
print(longestObstacleCourseAtEachPosition([3,1,5,6,4,2]))