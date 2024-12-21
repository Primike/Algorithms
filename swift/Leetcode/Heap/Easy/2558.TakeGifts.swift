// You are given an integer array gifts denoting the number of gifts 
// in various piles. Every second, you do the following:
// Choose the pile with the maximum number of gifts.
// If there is more than one pile with the maximum number of gifts, choose any.
// Leave behind the floor of the square root of the number of gifts 
// in the pile. Take the rest of the gifts.
// Return the number of gifts remaining after k seconds.

// Time: O(n * log(n)), Space: O(n)
func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
    var heap = Heap<Int>(.maxHeap, gifts)
    var result = gifts.reduce(0, +)

    for i in 0..<k {
        if heap.isEmpty { break }
        
        let largest = heap.pop()!
        let root = Int(sqrt(Double(largest)))
        result += root - largest
        heap.push(root)
    }

    return result
}

print(pickGifts([25,64,9,4,100], 4))
print(pickGifts([1,1,1,1], 4))