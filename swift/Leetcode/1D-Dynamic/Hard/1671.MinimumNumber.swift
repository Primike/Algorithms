func minimumMountainRemovals(_ nums: [Int]) -> Int {
    func lis(_ array: [Int]) -> [Int] {
        var tab = Array(repeating: 1, count: array.count)
        var stack = [array[0]]

        for i in 1..<array.count {
            var left = 0, right = stack.count - 1

            while left <= right {
                let mid = (right + left) / 2

                if stack[mid] < array[i] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            if left == stack.count {
                stack.append(array[i])
            } else {
                stack[left] = array[i]
            }

            tab[i] = left + 1
        }

        return tab
    }
    
    let increasing = lis(nums)
    let decreasing = Array(lis(Array(nums.reversed())).reversed())  
    var result = Int.max

    for i in 1..<nums.count - 1 {
        if increasing[i] > 1, decreasing[i] > 1 {
            let leftSide = i + 1 - increasing[i]
            let rightSide = nums.count - i - decreasing[i]
            result = min(result, leftSide + rightSide)
        }
    }

    return result
}