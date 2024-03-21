// You are given an integer array arr. From some starting index, 
// you can make a series of jumps. The (1st, 3rd, 5th, ...) 
// jumps in the series are called odd-numbered jumps, 
// and the (2nd, 4th, 6th, ...) jumps in the series are called even-numbered jumps.
// During odd-numbered jumps (i.e., jumps 1, 3, 5, ...), 
// you jump to the index j such that arr[i] <= arr[j] and arr[j] is the smallest possible value. 
// If there are multiple such indices j, you can only jump to the smallest such index j.
// During even-numbered jumps (i.e., jumps 2, 4, 6, ...), 
// you jump to the index j such that arr[i] >= arr[j] and arr[j] is the largest possible value. 
// If there are multiple such indices j, you can only jump to the smallest such index j.
// Return the number of good starting indices.

func oddEvenJumps(_ arr: [Int]) -> Int {
    var nextOdd = [Int](repeating: -1, count: arr.count)
    var nextEven = [Int](repeating: -1, count: arr.count)
    var sortedIndices = arr.enumerated().map { $0.offset }
    sortedIndices.sort { arr[$0] == arr[$1] ? $0 < $1 : arr[$0] < arr[$1] }
    var stack = [Int]()

    for index in sortedIndices {
        while let last = stack.last, last < index {
            nextOdd[stack.removeLast()] = index
        }

        stack.append(index)
    }

    sortedIndices.sort { arr[$0] == arr[$1] ? $0 < $1 : arr[$0] > arr[$1] }
    stack = []

    for index in sortedIndices {
        while let last = stack.last, last < index {
            nextEven[stack.removeLast()] = index
        }

        stack.append(index)
    }

    var memo = [String: Bool]()

    func dp(_ i: Int, _ isOdd: Bool) -> Bool {
        let key = "\(i),\(isOdd)"

        if i == arr.count - 1 { return true }
        if let cached = memo[key] { return cached }

        let index = isOdd ? nextOdd[i] : nextEven[i]
        let result = index != -1 ? dp(index, !isOdd) : false

        memo[key] = result
        return result
    }

    var result = 0

    for i in 0..<arr.count {
        if dp(i, true) { result += 1 }
    }

    return result
}

print(oddEvenJumps([10,13,12,14,15]))
print(oddEvenJumps([2,3,1,1,4]))
print(oddEvenJumps([5,1,3,4,2]))