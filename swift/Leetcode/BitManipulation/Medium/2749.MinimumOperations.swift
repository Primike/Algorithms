class Solution {
    func makeTheIntegerZero(_ num1: Int, _ num2: Int) -> Int {
        for k in 1... {
            let x = num1 - num2 * k
            
            if x < k { return -1 }
            if k >= x.nonzeroBitCount { return k }
        }

        return -1
    }
}