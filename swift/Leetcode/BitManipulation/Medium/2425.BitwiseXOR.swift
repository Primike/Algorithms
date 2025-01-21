func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var xor1 = 0
    var xor2 = 0
    let len1 = nums1.count
    let len2 = nums2.count
    
    if len2 % 2 != 0 {
        for num in nums1 {
            xor1 ^= num
        }
    }
    
    if len1 % 2 != 0 {
        for num in nums2 {
            xor2 ^= num
        }
    }
    
    return xor1 ^ xor2
}