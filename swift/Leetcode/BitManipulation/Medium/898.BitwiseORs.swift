class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        var ans = Set<Int>()
        var cur = Set<Int>()
        
        for x in arr {
            cur = Set(cur.map { x | $0 })
            cur.insert(x)
            ans.formUnion(cur)
        }
        
        return ans.count
    }
}