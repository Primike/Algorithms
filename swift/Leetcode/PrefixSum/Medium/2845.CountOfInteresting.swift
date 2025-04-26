func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
    var dict = [0: 1]
    var result = 0
    var count = 0
    
    for number in nums {
        count += (number % modulo == k) ? 1 : 0
        if let value = dict[(count - k + modulo) % modulo] { result += value }
        
        let remainder = count % modulo
        dict[remainder, default: 0] += 1
    }
    
    return result
}