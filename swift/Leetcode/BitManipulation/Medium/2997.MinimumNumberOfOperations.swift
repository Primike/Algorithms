// You can apply the following operation on the array any number of times:
// Choose any element of the array and flip a bit in its binary representation. 
// Flipping a bit means changing a 0 to 1 or vice versa.
// Return the minimum number of operations required to make the bitwise 
// XOR of all elements of the final array equal to k.

func minOperations(_ nums: [Int], _ k: Int) -> Int {
    var result = 0

    for number in nums {
        result ^= number
    }
    
    return (result ^ k).nonzeroBitCount
}

print(minOperations([2,1,3,4], 1))
print(minOperations([2,0,2,0], 0))