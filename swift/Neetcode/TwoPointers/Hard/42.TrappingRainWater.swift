func trap(_ height: [Int]) -> Int {
    if height.isEmpty {
        return 0
    }

    var l = 0, r = height.count - 1
    var leftMax = height[l], rightMax = height[r]
    var res = 0
    while l < r {
        if leftMax < rightMax {
            l += 1
            leftMax = max(leftMax, height[l])
            res += leftMax - height[l]
        } else {
            r -= 1
            rightMax = max(rightMax, height[r])
            res += rightMax - height[r]
        }
    }
    return res
}

print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
print(trap([4,2,0,3,2,5]))