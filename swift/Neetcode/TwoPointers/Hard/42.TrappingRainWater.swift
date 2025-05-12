// Given n non-negative integers representing an elevation map where the 
// width of each bar is 1, compute how much water it can trap after raining.

// Time: O(n), Space: O(1)
func trap(_ height: [Int]) -> Int {
    if height.isEmpty { return 0 }

    var left = 0, right = height.count - 1
    var leftMax = height[left], rightMax = height[right]
    var result = 0

    while left < right {
        if leftMax < rightMax {
            left += 1
            leftMax = max(leftMax, height[left])
            result += leftMax - height[left]
        } else {
            right -= 1
            rightMax = max(rightMax, height[right])
            result += rightMax - height[right]
        }
    }

    return result
}

print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
print(trap([4,2,0,3,2,5]))


func trap2(_ height: [Int]) -> Int {
    if height.count < 3 { return 0 }
    
    var leftMax = Array(repeating: height[0], count: height.count)

    for i in 1..<height.count {
        leftMax[i] = max(leftMax[i - 1], height[i - 1])
    }

    var rightMax = Array(repeating: height[height.count - 1], count: height.count)

    for i in (0..<(height.count - 1)).reversed() {
        rightMax[i] = max(rightMax[i + 1], height[i + 1])
    }

    var result = 0

    for i in 1..<(height.count - 1) {
        result += max(0, min(leftMax[i], rightMax[i]) - height[i])
    }

    return result
}