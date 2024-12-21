// You are given an array nums consisting of positive integers.
// Starting with score = 0, apply the following algorithm:
// Choose the smallest integer of the array that is not marked. 
// If there is a tie, choose the one with the smallest index.
// Add the value of the chosen integer to score.
// Mark the chosen element and its two adjacent elements if they exist.
// Repeat until all the array elements are marked.
// Return the score you get after applying the above algorithm.

// Time: O(n * log(n)), Space: O(n)
struct Element: Comparable {
    let i: Int
    let value: Int

    static func < (_ l: Element, _ r: Element) -> Bool {
        if l.value == r.value { return l.i < r.i }
        return l.value < r.value
    }
}

func findScore(_ nums: [Int]) -> Int {
    var heap = Heap<Element>(.minHeap)

    for i in 0..<nums.count {
        heap.push(Element(i: i, value: nums[i]))
    }

    var visited = Set<Int>()
    var result = 0

    while !heap.isEmpty {
        let smallest = heap.pop()!

        if !visited.contains(smallest.i) {
            result += smallest.value
            visited.insert(smallest.i)
            visited.insert(smallest.i - 1)
            visited.insert(smallest.i + 1)
        }
    }

    return result
}

print(findScore([2,1,3,4,5,2]))
print(findScore([2,3,5,1,3,2]))