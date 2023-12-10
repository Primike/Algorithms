// You are given an array of strings nums and an integer k. 
// Each string in nums represents an integer without leading zeros.
// Return the string that represents the kth largest integer in nums.

struct BigNumber: Comparable {
    let value: String

    static func <(left: BigNumber, right: BigNumber) -> Bool {
        if left.value.count != right.value.count {
            return left.value.count < right.value.count 
        }

        return left.value < right.value
    }
}

func kthLargestNumber(_ nums: [String], _ k: Int) -> String {
    var strings = nums.map { BigNumber(value: $0) }
    var heap = Heap<BigNumber>(type: .minHeap)

    for number in strings {
        if heap.count < k {
            heap.push(number)
            continue
        } else if number > heap.peek()! {
            heap.pop()
            heap.push(number)
        }
    }

    return heap.peek()!.value
}

print(kthLargestNumber(["3","6","7","10"], 4))
print(kthLargestNumber(["2","21","12","1"], 3))
print(kthLargestNumber(["0","0"], 2))