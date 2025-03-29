// You are given a sorted integer array arr containing 1 and prime numbers, 
// where all the integers of arr are unique. You are also given an integer k.
// For every i and j where 0 <= i < j < arr.length, we consider 
// the fraction arr[i] / arr[j].
// Return the kth smallest fraction considered. 
// Return your answer as an array of integers of size 2, 
// where answer[0] == arr[i] and answer[1] == arr[j].

struct PrimeFraction: Comparable {
    let i: Int
    let j: Int
    let fraction: Double

    static func < (_ l: PrimeFraction, _ r: PrimeFraction) -> Bool {
        return l.fraction < r.fraction
    }
}

// Time: O((n + k) * log(n)), Space: O(n)
func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
    var heap = Heap<PrimeFraction>(.minHeap)

    for i in 0..<arr.count {
        let ratio = Double(arr[i]) / Double(arr[arr.count - 1])
        let fraction = PrimeFraction(i: i, j: arr.count - 1, fraction: ratio)
        heap.push(fraction)
    }

    for _ in 0..<k - 1 {
        guard let smallest = heap.pop() else { continue }

        let i = smallest.i
        let j = smallest.j - 1

        if j > i {
            let ratio = Double(arr[i]) / Double(arr[j])
            let nextFraction = PrimeFraction(i: i, j: j, fraction: ratio)
            heap.push(nextFraction)
        }
    }

    guard let result = heap.pop() else { return [] }
    return [arr[result.i], arr[result.j]]
}

print(kthSmallestPrimeFraction([1,2,3,5], 3))
print(kthSmallestPrimeFraction([1,7], 1))