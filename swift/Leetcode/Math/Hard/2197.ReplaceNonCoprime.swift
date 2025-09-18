class Solution {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        var res: [Int] = []

        for num in nums {
            var newNum = num
            
            while !res.isEmpty, gcd(res.last!, newNum) > 1 {
                let top = res.removeLast()
                newNum = lcm(top, newNum)
            }
            
            res.append(newNum)
        }
        
        return res
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    private func lcm(_ a: Int, _ b: Int) -> Int {
        if a == 0 || b == 0 {
            return 0
        }
        return (a / gcd(a, b)) * b
    }
}