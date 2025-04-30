func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
    let n = nums.count
    var res = 0
    var total = 0
    var i = 0

    for j in 0..<n {
        total += nums[j]
        while i <= j {
            let length = j - i + 1
            if Int64(total) * Int64(length) >= Int64(k) {
                total -= nums[i]
                i += 1
            } else {
                break
            }
        }
        res += j - i + 1
    }
    return res
}
