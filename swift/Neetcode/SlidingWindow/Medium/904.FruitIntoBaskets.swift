// You are visiting a farm that has a single row of fruit trees arranged 
// from left to right. The trees are represented by an integer array fruits 
// where fruits[i] is the type of fruit the ith tree produces.
// You only have two baskets, and each basket can only hold a single type of fruit. 
// Given the integer array fruits, return the maximum number of fruits you can pick.

func totalFruit(_ fruits: [Int]) -> Int {
    var window = [Int: Int]()
    var result = 0
    var left = 0

    for (i, fruit) in fruits.enumerated() {
        window[fruit, default: 0] += 1

        if window.keys.count > 2 { 
            window[fruits[left]]! -= 1
            if window[fruits[left]]! == 0 { window[fruits[left]] = nil }
            left += 1
        } else {
            result = max(result, i - left + 1) 
        }
    }

    return result
}

print(totalFruit([1,2,1]))
print(totalFruit([0,1,2,2]))
print(totalFruit([1,2,3,2,2]))