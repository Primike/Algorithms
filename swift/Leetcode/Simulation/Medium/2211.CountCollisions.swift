class Solution {
    func countCollisions(_ directions: String) -> Int {
        let trimmed = directions.drop(while: { $0 == "L" })
                                .reversed()
                                .drop(while: { $0 == "R" })
        
        return trimmed.filter { $0 != "S" }.count
    }
}