// Given an integer n, return all the numbers in the range 
// [1, n] sorted in lexicographical order.
// You must write an algorithm that runs in O(n) time 
// and uses O(1) extra space. 

// Time: O(n), Space: O(n)
func lexicalOrder(_ n: Int) -> [Int] {
    var result = [Int]()

    func dfs(_ current: Int) {
        if current > n { return }

        result.append(current)

        for i in 0...9 {
            let number = current * 10 + i
            dfs(number)
        }
    }

    for i in 1...9 {
        dfs(i)
    }

    return result
}

print(lexicalOrder(13))
print(lexicalOrder(2))