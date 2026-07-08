class Solution {
    func earliestFinishTime(
        _ landStartTime: [Int],
        _ landDuration: [Int],
        _ waterStartTime: [Int],
        _ waterDuration: [Int]
    ) -> Int {
        
        func solve(_ start1: [Int], _ duration1: [Int], _ start2: [Int], _ duration2: [Int]) -> Int {
            var finish1 = Int.max
            for i in 0..<start1.count {
                finish1 = min(finish1, start1[i] + duration1[i])
            }
            
            var finish2 = Int.max
            for i in 0..<start2.count {
                finish2 = min(finish2, max(start2[i], finish1) + duration2[i])
            }
            return finish2
        }
        
        let landWater = solve(landStartTime, landDuration, waterStartTime, waterDuration)
        let waterLand = solve(waterStartTime, waterDuration, landStartTime, landDuration)
        
        return min(landWater, waterLand)
    }
}