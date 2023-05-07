//Given an integer array nums and an integer k, 
//return the k most frequent elements. 
//You may return the answer in any order.

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = nums.reduce(into: [:]) { currentDict, number in
        currentDict[number, default: 0] += 1
    }
    var frequency: [[Int]] = Array(repeating: [], count: nums.count + 1)
    var result: [Int] = []

    for (key, value) in dict {
        frequency[value].append(key)
    }

    for i in (0..<frequency.count).reversed() {
        for number in frequency[i] {
            result.append(number)

            if result.count == k {
                return result
            }
        }
    }

    return result
}

print(topKFrequent([1,1,1,2,2,3], 2))
print(topKFrequent([1], 1))