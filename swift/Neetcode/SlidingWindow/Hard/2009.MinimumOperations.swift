// Return the minimum number of operations to make nums continuous.

func minOperations(_ nums: [Int]) -> Int {
    let unique = Array(Set(nums)).sorted()
    var window = 0
    var j = 0

    for i in 0..<unique.count {
        while j < unique.count, unique[j] - unique[i] < nums.count {
            j += 1
        }
        
        window = max(window, j - i)
    }

    return nums.count - window
}

print(minOperations([4,2,5,3]))
print(minOperations([1,2,3,5,6]))
print(minOperations([1,10,100,1000]))