// You are given two integers n and x. 
// You have to construct an array of positive integers nums 
// of size n where for every 0 <= i < n - 1, nums[i + 1] 
// is greater than nums[i], and the result of the bitwise AND operation 
// between all elements of nums is x.
// Return the minimum possible value of nums[n - 1].

func minEnd(_ n: Int, _ x: Int) -> Int {
    var result = x
    var n = n

    while n > 1 {
        result = (result + 1) | x
        n -= 1
    }

    return result
}

print(minEnd(3, 4))
print(minEnd(2, 7))