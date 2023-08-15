// You are visiting a farm that has a single row of fruit trees arranged 
// from left to right. The trees are represented by an integer array fruits 
// where fruits[i] is the type of fruit the ith tree produces.
// You only have two baskets, and each basket can only hold a single type of fruit. 
// Given the integer array fruits, return the maximum number of fruits you can pick.

func totalFruit(_ fruits: [Int]) -> Int {
    var fruitDict = [Int: Int]()
    var left = 0
    var result = 0

    for i in 0..<fruits.count {
        fruitDict[fruits[i], default: 0] += 1

        if fruitDict.keys.count > 2 {
            fruitDict[fruits[left], default: 0] -= 1
            if fruitDict[fruits[left], default: 0] == 0 { fruitDict[fruits[left]] = nil }
            left += 1
        }

        if fruitDict.keys.count <= 2 { result = max(result, i + 1 - left) }
    }

    return result
}

print(totalFruit([1,2,1]))
print(totalFruit([0,1,2,2]))
print(totalFruit([1,2,3,2,2]))