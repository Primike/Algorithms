// Given an integer array nums and an integer k, 
// return the k most frequent elements. 
// You may return the answer in any order.

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var bucket: [[Int]] = Array(repeating: [], count: nums.count + 1)
    var dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }

    for (number, count) in dict {
        bucket[count].append(number)
    }

    var result = [Int]()

    for i in stride(from: bucket.count - 1, to: -1, by: -1) {
        for number in bucket[i] {
            result.append(number)

            if result.count == k { return result }
        }
    }

    return result
}

print(topKFrequent([1,1,1,2,2,3], 2))
print(topKFrequent([1], 1))