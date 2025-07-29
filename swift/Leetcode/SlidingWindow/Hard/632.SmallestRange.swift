// You have k lists of sorted integers in non-decreasing order. 
// Find the smallest range that includes at least one number 
// from each of the k lists.
// We define the range [a, b] is smaller than range [c, d] 
// if b - a < d - c or a < c if b - a == d - c.

// Time: O(n * log(n)), Space: O(n)
func smallestRange(_ nums: [[Int]]) -> [Int] {
    var array = [(Int, Int)]()

    for i in 0..<nums.count {
        for j in 0..<nums[i].count {
            array.append((i, nums[i][j]))
        }
    }

    array.sort { $0.1 < $1.1 }
    var idDict = [Int: Int]()
    var result = (0, 0)
    var smallest = Int.max
    var left = 0

    for i in 0..<array.count {
        idDict[array[i].0, default: 0] += 1

        while idDict.keys.count == nums.count {
            let difference = array[i].1 - array[left].1

            if difference < smallest {
                smallest = difference
                result = (left, i)
            }

            idDict[array[left].0, default: 1] -= 1
            if idDict[array[left].0] == 0 { idDict[array[left].0] = nil }
            left += 1
        }
    }

    return [array[result.0].1, array[result.1].1]
}

print(smallestRange([[4,10,15,24,26],[0,9,12,20],[5,18,22,30]]))
print(smallestRange([[1,2,3],[1,2,3],[1,2,3]]))