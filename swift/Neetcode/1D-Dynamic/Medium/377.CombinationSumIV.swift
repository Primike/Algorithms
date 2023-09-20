// Given an array of distinct integers nums and a target integer target, 
// return the number of possible combinations that add up to target.

func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var tab = Array(repeating: 0, count: target + 1)
    tab[0] = 1

    for i in 0..<target {
        for number in nums {
            let index = i + number 

            if index >= tab.count { continue } 
            if tab[i] > (Int.max - tab[index]) { continue }
            
            tab[index] += tab[i]
        }
    }

    return tab[target]
}

print(combinationSum4([1,2,3], 4))
print(combinationSum4([9], 3))