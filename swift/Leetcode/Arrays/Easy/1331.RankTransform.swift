// Given an array of integers arr, replace each element with its rank.
// The rank represents how large the element is. 
// The rank has the following rules:
// Rank is an integer starting from 1.
// The larger the element, the larger the rank. 
// If two elements are equal, their rank must be the same.
// Rank should be as small as possible.

// Time: O(n * log(n)), Space: O(n)
func arrayRankTransform(_ arr: [Int]) -> [Int] {
    var numbers = Array(Set(arr)).sorted()
    var rank = [Int: Int]()

    for (i, number) in numbers.enumerated() {
        rank[number] = i + 1
    }

    var result = [Int]()

    for number in arr {
        result.append(rank[number, default: 0])
    }

    return result
}

print(arrayRankTransform([40,10,20,30]))
print(arrayRankTransform([100,100,100]))
print(arrayRankTransform([37,12,28,9,100,56,80,5,12]))