class Solution {
    func kEmptySlots(_ flowers: [Int], _ k: Int) -> Int {
        var days = [Int](repeating: 0, count: flowers.count)
        for i in 0..<flowers.count {
            days[flowers[i] - 1] = i + 1
        }

        var ans = Int.max
        var left = 0
        var right = k + 1

        search: while right < days.count {
            let leftDay = days[left]
            let rightDay = days[right]
            
            for i in (left + 1)..<right {
                if days[i] < leftDay || days[i] < rightDay {
                    left = i
                    right = i + k + 1
                    continue search
                }
            }
            
            ans = min(ans, max(leftDay, rightDay))
            left = right
            right = left + k + 1
        }

        return ans < Int.max ? ans : -1
    }
}