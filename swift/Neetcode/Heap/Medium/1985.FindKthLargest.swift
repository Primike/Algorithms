// You are given an array of strings nums and an integer k. 
// Each string in nums represents an integer without leading zeros.
// Return the string that represents the kth largest integer in nums.

struct CustomString: Comparable {
    let value: String

    init(_ value: String) {
        self.value = value
    }

    static func < (lhs: CustomString, rhs: CustomString) -> Bool {
        if lhs.value.count == rhs.value.count {
            return lhs.value < rhs.value
        }

        return lhs.value.count < rhs.value.count
    }
}

func kthLargestNumber(_ nums: [String], _ k: Int) -> String {
    let strings = nums.map { CustomString($0) }
    var minHeap = Heap<CustomString>(type: .minHeap)

    for number in strings {
        if minHeap.size() < k {
            minHeap.push(number)
        } else if number > minHeap.peek()! {
            minHeap.pop()
            minHeap.push(number)
        }
    }

    return minHeap.pop()!.value
}

print(kthLargestNumber(["3","6","7","10"], 4))
print(kthLargestNumber(["2","21","12","1"], 3))
print(kthLargestNumber(["0","0"], 2))