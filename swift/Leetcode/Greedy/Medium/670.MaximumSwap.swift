// You are given an integer num. You can swap two digits at most once 
// to get the maximum valued number.
// Return the maximum valued number you can get.

// Time: O(n), Space: O(1)
func maximumSwap(_ num: Int) -> Int {
    var num = Array(String(num))
    var maxFromRight = Array(repeating: 0, count: num.count)
    maxFromRight[num.count - 1] = num.count - 1

    for i in (0..<(num.count - 1)).reversed() {   
        if num[i] > num[maxFromRight[i + 1]] {
            maxFromRight[i] = i
        } else {
            maxFromRight[i] = maxFromRight[i + 1]
        }
    }

    for i in 0..<maxFromRight.count {
        if num[i] == num[maxFromRight[i]] { continue }
        if maxFromRight[i] != i {
            num.swapAt(i, maxFromRight[i])
            break
        }
    }

    return Int(String(num)) ?? 0
}

print(maximumSwap(2736))
print(maximumSwap(9973))