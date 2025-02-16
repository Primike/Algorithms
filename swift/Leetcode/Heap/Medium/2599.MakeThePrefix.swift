// You are given a 0-indexed integer array nums. 
// You can apply the following operation any number of times:
// Pick any element from nums and put it at the end of nums.
// The prefix sum array of nums is an array prefix of the 
// same length as nums such that prefix[i] is the sum of 
// all the integers nums[j] where j is in the inclusive range [0, i].
// Return the minimum number of operations such that the 
// prefix sum array does not contain negative integers. 

func makePrefSumNonNegative(_ nums: [Int]) -> Int {
    var operations = 0
    var prefixSum = 0
    var heap = Heap<Int>(.minHeap)
    
    for num in nums {
        if num < 0 {
            heap.push(num)
        }
        prefixSum += num
        if prefixSum < 0, let popped = heap.pop() {
            prefixSum -= popped
            operations += 1
        }
    }
    return operations
}

print(makePrefSumNonNegative([2,3,-5,4]))
print(makePrefSumNonNegative([3,-5,-2,6]))