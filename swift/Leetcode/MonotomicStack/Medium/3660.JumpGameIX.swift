class Solution {
    struct Item {
        var value: Int
        var left: Int
        var right: Int
    }

    func maxValue(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = Array(repeating: 0, count: n)
        var stack: [Item] = []

        for i in 0..<n {
            var curr = Item(value: nums[i], left: i, right: i)

            while let last = stack.last, last.value > nums[i] {
                stack.removeLast()
                curr.value = max(curr.value, last.value)
                curr.left = last.left
            }

            stack.append(curr)
        }

        for item in stack {
            for j in item.left...item.right {
                ans[j] = item.value
            }
        }

        return ans
    }
}