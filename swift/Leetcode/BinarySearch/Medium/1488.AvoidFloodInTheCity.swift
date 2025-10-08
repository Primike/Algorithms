class Solution {
    func avoidFlood(_ rains: [Int]) -> [Int] {
        var ans = [Int](repeating: 1, count: rains.count)
        var fullLakes = [Int: Int]()
        var dryDays = [Int]()

        for (day, lake) in rains.enumerated() {
            if lake == 0 {
                dryDays.append(day)
                continue
            }

            ans[day] = -1
            if let lastRainyDay = fullLakes[lake] {
                var low = 0
                var high = dryDays.count
                var dryDayIndex: Int? = nil
                
                while low < high {
                    let mid = low + (high - low) / 2
                    if dryDays[mid] > lastRainyDay {
                        dryDayIndex = mid
                        high = mid
                    } else {
                        low = mid + 1
                    }
                }

                if let idx = dryDayIndex {
                    let dayToUse = dryDays[idx]
                    ans[dayToUse] = lake
                    dryDays.remove(at: idx)
                    fullLakes[lake] = day
                } else {
                    return []
                }
            } else {
                fullLakes[lake] = day
            }
        }
        
        return ans
    }
}