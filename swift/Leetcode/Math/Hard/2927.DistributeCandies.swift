class Solution {
    private func cal(_ x: Int) -> Int {
        if x < 0 {
            return 0
        }
        return x * (x - 1) / 2
    }

    func distributeCandies(_ n: Int, _ limit: Int) -> Int {
        return (
            cal(n + 2)
            - 3 * cal(n - limit + 1)
            + 3 * cal(n - (limit + 1) * 2 + 2)
            - cal(n - 3 * (limit + 1) + 2)
        )
    }
}