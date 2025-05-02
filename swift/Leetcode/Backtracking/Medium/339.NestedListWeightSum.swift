// You are given a nested list of integers nestedList. 
// Each element is either an integer or a list whose elements 
// may also be integers or other lists.
// The depth of an integer is the number of lists that it is inside of. 
// For example, the nested list [1,[2,2],[[3],2],1] 
// has each integer's value set to its depth.
// Return the sum of each integer in nestedList multiplied by its depth.

// Time: O(n), Space: O(n)
func depthSum(_ nestedList: [NestedInteger]) -> Int {
    var result = 0

    func backtrack(_ list: [NestedInteger], _ level: Int) {
        for i in 0..<list.count {
            if list[i].isInteger() {
                result += list[i].getInteger() * level
            } else {
                backtrack(list[i].getList(), level + 1)
            }
        }
    }

    backtrack(nestedList, 1)
    return result
}