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

// Time: O(n * log(n) + n), Space: O(n)
func oddEvenJumps(_ arr: [Int]) -> Int {
    var nextOdd = Array(repeating: -1, count: arr.count)
    var nextEven = Array(repeating: -1, count: arr.count)
    var indicies = arr.enumerated().map { $0.offset }
    var stack = [Int]()

    for i in indicies.sorted { (arr[$0], $0) < (arr[$1], $1) } {
        while let last = stack.last, last < i {
            stack.removeLast()
            nextOdd[last] = i
        }

        stack.append(i)
    }

    stack = []

    for i in indicies.sorted { (-arr[$0], $0) < (-arr[$1], $1) }  {
        while let last = stack.last, last < i {
            stack.removeLast()
            nextEven[last] = i
        }

        stack.append(i)
    }

    var tabOdd = Array(repeating: false, count: arr.count)
    var tabEven = Array(repeating: false, count: arr.count)
    tabOdd[arr.count - 1] = true
    tabEven[arr.count - 1] = true

    for i in (0..<(arr.count - 1)).reversed() {
        if nextOdd[i] != -1 { tabOdd[i] = tabEven[nextOdd[i]] }
        if nextEven[i] != -1 { tabEven[i] = tabOdd[nextEven[i]] }
    }

    return tabOdd.filter { $0 }.count
}

print(oddEvenJumps([10,13,12,14,15]))
print(oddEvenJumps([2,3,1,1,4]))
print(oddEvenJumps([5,1,3,4,2]))


func oddEvenJumps2(_ arr: [Int]) -> Int {
    var nextOdd = Array(repeating: -1, count: arr.count)
    var nextEven = Array(repeating: -1, count: arr.count)
    var indicies = arr.enumerated().map { $0.offset }
    var stack = [Int]()

    for i in indicies.sorted { (arr[$0], $0) < (arr[$1], $1) } {
        while let last = stack.last, last < i {
            stack.removeLast()
            nextOdd[last] = i
        }

        stack.append(i)
    }

    stack = []

    for i in indicies.sorted { (-arr[$0], $0) < (-arr[$1], $1) }  {
        while let last = stack.last, last < i {
            stack.removeLast()
            nextEven[last] = i
        }

        stack.append(i)
    }

    var memo = [String: Bool]()

    func dp(_ i: Int, _ isOdd: Bool) -> Bool {
        let key = "\(i),\(isOdd)"

        if i == arr.count - 1 { return true }
        if let value = memo[key] { return value }

        let nextJump = isOdd ? nextOdd[i] : nextEven[i]
        let result = nextJump == -1 ? false : dp(nextJump, !isOdd)

        memo[key] = result
        return result
    }

    var result = 0

    for i in 0..<arr.count {
        if dp(i, true) { result += 1 }
    }

    return result
}