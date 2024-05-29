// You are given an array target of n integers. From a starting array 
// arr consisting of n 1's, you may perform the following procedure :
// let x be the sum of all elements currently in your array.
// choose index i, such that 0 <= i < n and set the value of arr at index i to x.
// You may repeat this procedure as many times as needed.
// Return true if it is possible to construct the target array from arr, 
// otherwise, return false.

func isPossible(_ target: [Int]) -> Bool {
    if target.count == 1 { return target[0] == 1 }
    
    var heap = Heap(.maxHeap, target)
    var total = target.reduce(0, +)

    while let largest = heap.pop(), largest > 1 {
        let remainder = total - largest
        
        if remainder == 1 { return true }
        let n = largest % remainder

        if n == 0 || n == largest { return false }

        heap.push(n)
        total += n - largest
    }
    
    return true
}

print(isPossible([9,3,5]))
print(isPossible([1,1,1,2]))
print(isPossible([8,5]))