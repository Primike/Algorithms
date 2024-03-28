// You can perform two types of operations on any element of the array any number of times:
// If the element is even, divide it by 2, If the element is odd, multiply it by 2
// Return the minimum deviation the array can have after performing some number of operations.

struct Deviation: Comparable {
    let current: Int
    let maxVal: Int

    static func < (_ l: Deviation, _ r: Deviation) -> Bool {
        return l.current < r.current
    }
}

func minimumDeviation(_ nums: [Int]) -> Int {
    var heap = Heap<Deviation>(.minHeap)
    var maximum = 0
    
    for number in nums {
        let maxVal = number % 2 == 0 ? number : number * 2
        var current = number

        while current % 2 == 0 {
            current /= 2
        }

        heap.push(Deviation(current: current, maxVal: maxVal))
        maximum = max(maximum, current)
    }

    var result = Int.max
    
    while heap.count == nums.count {
        let smallest = heap.pop()!
        result = min(result, maximum - smallest.current)
        
        if smallest.current < smallest.maxVal {
            maximum = max(maximum, smallest.current * 2)
            heap.push(Deviation(current: smallest.current * 2, maxVal: smallest.maxVal))
        }
    }

    return result
}

print(minimumDeviation([1,2,3,4]))
print(minimumDeviation([4,1,5,20,3]))
print(minimumDeviation([2,10,8]))