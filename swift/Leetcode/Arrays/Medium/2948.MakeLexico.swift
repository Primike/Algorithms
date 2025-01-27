func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
    let numsSorted = nums.sorted()
    var currGroup = 0
    var numToGroup = [Int: Int]()
    numToGroup[numsSorted[0]] = currGroup
    
    var groupToList = [Int: [Int]]()
    groupToList[currGroup] = [numsSorted[0]]
    
    for i in 1..<numsSorted.count {
        if abs(numsSorted[i] - numsSorted[i - 1]) > limit {
            currGroup += 1
        }
        numToGroup[numsSorted[i]] = currGroup
        if groupToList[currGroup] == nil {
            groupToList[currGroup] = []
        }
        groupToList[currGroup]?.append(numsSorted[i])
    }
    
    var result = nums
    for i in 0..<nums.count {
        let num = nums[i]
        if let group = numToGroup[num], !groupToList[group]!.isEmpty {
            result[i] = groupToList[group]!.removeFirst()
        }
    }
    
    return result
}