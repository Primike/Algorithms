    func minimumTotalDistance(_ robot: [Int], _ factory: [[Int]]) -> Int {
        var sortedRobot = robot.sorted()
        var sortedFactory = factory.sorted { $0[0] < $1[0] }
        var factoryPositions = [Int]()
        
        for f in sortedFactory {
            factoryPositions += Array(repeating: f[0], count: f[1])
        }
        
        let robotCount = sortedRobot.count
        let factoryCount = factoryPositions.count
        var dp = Array(repeating: Array(repeating: nil as Int?, count: factoryCount + 1), count: robotCount + 1)
        
        func calculateMinDistance(_ robotIdx: Int, _ factoryIdx: Int) -> Int {
            if let cached = dp[robotIdx][factoryIdx] {
                return cached
            }
            if robotIdx == robotCount {
                dp[robotIdx][factoryIdx] = 0
                return 0
            }
            if factoryIdx == factoryCount {
                dp[robotIdx][factoryIdx] = Int(1e12)
                return Int(1e12)
            }
            
            let assign = abs(sortedRobot[robotIdx] - factoryPositions[factoryIdx]) + calculateMinDistance(robotIdx + 1, factoryIdx + 1)
            let skip = calculateMinDistance(robotIdx, factoryIdx + 1)
            
            dp[robotIdx][factoryIdx] = min(assign, skip)
            return dp[robotIdx][factoryIdx]!
        }
        
        return calculateMinDistance(0, 0)
    }
