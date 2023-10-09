// You can perform two types of operations on any element of the array any number of times:
// If the element is even, divide it by 2, If the element is odd, multiply it by 2
// Return the minimum deviation the array can have after performing some number of operations.

struct Transformed: Comparable {
    let number: Int
    let maxVal: Int

    static func <(left: Transformed, right: Transformed) -> Bool {
        return left.number < right.number
    }
}

func minimumDeviation(_ nums: [Int]) -> Int {
    var heap = Heap<Transformed>(type: .minHeap)
    var heapMax = 0
    
    for number in nums {
        let maxVal = number % 2 == 0 ? number : number * 2
        var n = number

        while n % 2 == 0 {
            n /= 2
        }

        heap.push(Transformed(number: n, maxVal: maxVal))
        heapMax = max(heapMax, n)
    }

    var result = Int.max
    
    while heap.count == nums.count {
        let smallest = heap.pop()!
        result = min(result, heapMax - smallest.number)
        
        if smallest.number < smallest.maxVal {
            heapMax = max(heapMax, smallest.number * 2)
            heap.push(Transformed(number: smallest.number * 2, maxVal: smallest.maxVal))
        }
    }

    return result
}

print(minimumDeviation[1,2,3,4])
print(minimumDeviation([4,1,5,20,3]))
print(minimumDeviation([2,10,8]))