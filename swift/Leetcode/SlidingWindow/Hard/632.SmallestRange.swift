// You have k lists of sorted integers in non-decreasing order. 
// Find the smallest range that includes at least one number 
// from each of the k lists.
// We define the range [a, b] is smaller than range [c, d] 
// if b - a < d - c or a < c if b - a == d - c.

// Time: O(n * logn), Space: O(n)
func smallestRange(_ nums: [[Int]]) -> [Int] {
    var numbers = [(Int, Int)]()

    for (i, num) in nums.enumerated() {
        var array = num.map { ($0, i) }
        numbers.append(contentsOf: array)
    }

    numbers.sort { $0.0 < $1.0 }
    let target = nums.count
    var indicies = [Int: Int]()
    var result = Int.max, position = [0, 0]
    var left = 0, right = 0
    
    for i in 0..<numbers.count {
        indicies[numbers[i].1, default: 0] += 1

        while left < right, indicies.keys.count == target {
            if result > numbers[right].0 - numbers[left].0 {
                result = numbers[right].0 - numbers[left].0
                position = [left, right]
            }

            indicies[numbers[left].1, default: 1] -= 1
            if indicies[numbers[left].1, default: 0] == 0 { indicies[numbers[left].1] = nil }
            left += 1
        }

        right += 1
    }

    return [numbers[position[0]].0, numbers[position[1]].0]
}
