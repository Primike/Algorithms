class Solution {
    func smallestNumber(_ n: Int) -> Int {
        var x = 1

        while x < n {
            x = x * 2 + 1
        }

        return x
    }
}