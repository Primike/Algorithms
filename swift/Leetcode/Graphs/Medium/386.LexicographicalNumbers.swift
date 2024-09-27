// Given an integer n, return all the numbers in the range 
// [1, n] sorted in lexicographical order.
// You must write an algorithm that runs in O(n) time 
// and uses O(1) extra space. 

func lexicalOrder(_ n: Int) -> [Int] {
    var result = [Int]()

    func dfs(_ currentNumber: Int, _ limit: Int) {
        if currentNumber > limit { return }

        result.append(currentNumber)

        for nextDigit in 0...9 {
            let nextNumber = currentNumber * 10 + nextDigit
            if nextNumber <= limit {
                dfs(nextNumber, limit)
            } else {
                break 
            }
        }
    }
    
    for start in 1...9 {
        dfs(start, n)
    }
    
    return result
}

print(lexicalOrder(13))
print(lexicalOrder(2))