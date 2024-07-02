// Given an integer array nums and an integer k, return the maximum sum 
// of a non-empty subsequence of that array such that for every two 
// consecutive integers in the subsequence, nums[i] and nums[j], 
// where i < j, the condition j - i <= k is satisfied.

// Time: O(n), Space: O(n)
func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
    var tab = Array(repeating: 0, count: nums.count)
    var deque = [Int]()

    for i in 0..<nums.count {
        if let first = deque.first, first < i - k { deque.removeFirst() }

        tab[i] = nums[i]

        if let first = deque.first { tab[i] += max(tab[first], 0) }

        while let last = deque.last, tab[i] >= tab[last] {
            deque.removeLast()
        }

        deque.append(i)
    }

    return tab.max() ?? 0
}

print(constrainedSubsetSum([10,2,-10,5,20], 2))
print(constrainedSubsetSum([-1,-2,-3], 1))
print(constrainedSubsetSum([10,-2,-10,-5,20], 2))


struct Element: Comparable {
    let i: Int
    let value: Int

    static func < (_ l: Element, _ r: Element) -> Bool {
        return l.value < r.value
    }
}

func constrainedSubsetSum2(_ nums: [Int], _ k: Int) -> Int {
    var heap = Heap<Element>(.maxHeap, [Element(i: 0, value: nums[0])])
    var result = nums[0]

    for i in 1..<nums.count {
        while let index = heap.peek()?.i, i - index > k {
            heap.pop()
        }

        let current = max(0, heap.peek()?.value ?? 0) + nums[i]
        result = max(result, current)
        heap.push(Element(i: i, value: current))
    }

    return result
}