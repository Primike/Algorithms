// You are given two lists of closed intervals, 
// firstList and secondList, where firstList[i] = [starti, endi] 
// and secondList[j] = [startj, endj]. 
// Each list of intervals is pairwise disjoint and in sorted order.
// Return the intersection of these two interval lists.

// Time: O(n), Space: O(1)
func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
    var i = 0, j = 0
    var result = [[Int]]()

    while i < firstList.count, j < secondList.count {
        if firstList[i][1] >= secondList[j][1] {
            if firstList[i][0] <= secondList[j][1] {
                let start = max(firstList[i][0], secondList[j][0])
                result.append([start, secondList[j][1]])
            }

            j += 1
        } else {
            if firstList[i][1] >= secondList[j][0] {
                let start = max(firstList[i][0], secondList[j][0])
                result.append([start, firstList[i][1]])
            }

            i += 1
        }
    }

    return result
}

print(intervalIntersection([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]]))
print(intervalIntersection([[1,3],[5,9]], []))