// Return an array ans of length n, where ans[i] is the length of the 
// longest obstacle course for index i as described above.

// BS Finds position were current is greater than last element in a subsequence
// it will overwrite a larger value and use the smaller as the new last 

// Time: O(n * logn), Space: O(n)
func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
    var tab = [Int](repeating: 1, count: obstacles.count)
    var last = [Int]()

    for (i, height) in obstacles.enumerated() {
        var low = 0, high = last.count

        while low < high {
            let mid = low + (high - low) / 2

            if last[mid] <= height {
                low = mid + 1
            } else {
                high = mid
            }
        }

        if low == last.count {
            last.append(height)
        } else {
            last[low] = height
        }
        
        tab[i] = low + 1
    }
    
    return tab
}

print(longestObstacleCourseAtEachPosition([1,2,3,2]))
print(longestObstacleCourseAtEachPosition([2,2,1]))
print(longestObstacleCourseAtEachPosition([3,1,5,6,4,2]))