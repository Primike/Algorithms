class Solution {
    func maxCandies(_ status: [Int], _ candies: [Int], _ keys: [[Int]], _ containedBoxes: [[Int]], _ initialBoxes: [Int]) -> Int {
        let n = status.count
        var canOpen = status.map { $0 == 1 }
        var hasBox = Array(repeating: false, count: n)
        var used = Array(repeating: false, count: n)

        var q: [Int] = []
        var ans = 0

        for box in initialBoxes {
            hasBox[box] = true
            if canOpen[box] {
                if !used[box] { // Ensure not to process already processed initial boxes if they could be opened
                    q.append(box)
                    used[box] = true
                    ans += candies[box]
                }
            }
        }

        var head = 0
        while head < q.count {
            let bigBox = q[head]
            head += 1

            for key in keys[bigBox] {
                if !canOpen[key] { // Only update if it was previously closed
                    canOpen[key] = true
                    if hasBox[key] && !used[key] {
                        q.append(key)
                        used[key] = true
                        ans += candies[key]
                    }
                }
            }

            for box in containedBoxes[bigBox] {
                hasBox[box] = true
                if canOpen[box] && !used[box] {
                    q.append(box)
                    used[box] = true
                    ans += candies[box]
                }
            }
        }
        return ans
    }
}