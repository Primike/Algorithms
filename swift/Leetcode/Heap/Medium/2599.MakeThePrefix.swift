// You are given a 0-indexed integer array nums. 
// You can apply the following operation any number of times:
// Pick any element from nums and put it at the end of nums.
// The prefix sum array of nums is an array prefix of the 
// same length as nums such that prefix[i] is the sum of 
// all the integers nums[j] where j is in the inclusive range [0, i].
// Return the minimum number of operations such that the 
// prefix sum array does not contain negative integers. 

// Time: O(n * log(n)), Space: O(n)
func makePrefSumNonNegative(_ nums: [Int]) -> Int {
    var heap = Heap<Int>(.minHeap)
    var result = 0
    var total = 0

    for number in nums {
        total += number

        if number < 0 { heap.push(number) }

        if total < 0, !heap.isEmpty {
            total -= heap.pop()!
            result += 1
        }
    }

    return result
}

print(makePrefSumNonNegative([2,3,-5,4]))
print(makePrefSumNonNegative([3,-5,-2,6]))