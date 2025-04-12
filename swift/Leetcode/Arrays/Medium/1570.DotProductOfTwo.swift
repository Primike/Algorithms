// Given two sparse vectors, compute their dot product.

// Time: O(n), Space: O(n)
class SparseVector {
    
    var dict: [Int: Int]

    init(_ nums: [Int]) {
        self.dict = [Int: Int]()

        for i in 0..<nums.count {
            if nums[i] == 0 { continue }
            dict[i] = nums[i]
        }
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var result = 0

        for (key, value) in dict {
            result += vec.dict[key, default: 0] * value
        }

        return result
    }
}