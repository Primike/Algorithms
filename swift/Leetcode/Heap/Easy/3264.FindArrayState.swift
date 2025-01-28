// You need to perform k operations on nums. In each operation:
// Find the minimum value x in nums. If there are multiple occurrences 
// of the minimum value, select the one that appears first.
// Replace the selected minimum value x with x * multiplier.
// Return an integer array denoting the final state of nums 
// after performing all k operations.

struct Value: Comparable {
    let i: Int
    let number: Int
    
    static func < (_ l: Value, _ r: Value) -> Bool {
        if l.number == r.number { return l.i < r.i }
        return l.number < r.number
    }
}

// Time: O(n * log(n)), Space: O(n)
func getFinalState(_ nums: [Int], _ k: Int, _ multiplier: Int) -> [Int] {
    var heap = Heap<Value>(.minHeap)

    for i in 0..<nums.count {
        heap.push(Value(i: i, number: nums[i]))
    }

    for _ in 0..<k {
        let smallest = heap.pop()!
        heap.push(Value(i: smallest.i, number: smallest.number * multiplier))
    }

    var result = nums

    while let first = heap.pop() {
        result[first.i] = first.number
    }

    return result
}

print(getFinalState([2,1,3,5,6], 5, 2))
print(getFinalState([1,2], 3, 4))