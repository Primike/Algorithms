class Solution {
    func maxDistance(_ side: Int, _ points: [[Int]], _ k: Int) -> Int {
        var arr: [Int] = []
        
        for point in points {
            let x = point[0]
            let y = point[1]
            if x == 0 {
                arr.append(y)
            } else if y == side {
                arr.append(side + x)
            } else if x == side {
                arr.append(side * 3 - y)
            } else {
                arr.append(side * 4 - x)
            }
        }
        
        arr.sort()
        let n = arr.count
        let perimeter = side * 4
        
        func bisectLeft(_ target: Int) -> Int {
            var low = 0
            var high = n
            while low < high {
                let mid = low + (high - low) / 2
                if arr[mid] < target {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
            return low
        }
        
        func check(_ limit: Int) -> Bool {
            for i in 0..<n {
                let start = arr[i]
                let end = start + perimeter - limit
                var cur = start
                var count = 1
                
                while count < k {
                    let idx = bisectLeft(cur + limit)
                    if idx == n || arr[idx] > end {
                        break
                    }
                    cur = arr[idx]
                    count += 1
                }
                
                if count == k {
                    return true
                }
            }
            return false
        }
        
        var lo = 1
        var hi = side
        var ans = 0
        
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if check(mid) {
                ans = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        
        return ans
    }
}