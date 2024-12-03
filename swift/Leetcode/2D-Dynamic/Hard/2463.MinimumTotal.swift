// factory[j] = [positionj, limitj] indicates that positionj is the position 
// of the jth factory and that the jth factory can repair at most limitj robots.
// The positions of each robot are unique. The positions of each factory are also unique.
// All the robots are initially broken; they keep moving in one direction.
// When a robot reaches a factory that did not reach its limit, 
// the factory repairs the robot, and it stops moving.
// Return the minimum total distance traveled by all the robots.
// All robots move at the same speed.
// If two robots move in the same direction, they will never collide.
// If two robots move in opposite directions and they meet at some point, 
// they do not collide. They cross each other.
// If a robot passes by a factory that reached its limits, 
// it crosses it as if it does not exist.

// Time: O(r^2 * f), Space: O(r * f)
func minimumTotalDistance(_ robot: [Int], _ factory: [[Int]]) -> Int {
    var robot = robot.sorted()
    var factory = factory.sorted { $0[0] < $1[0] }.flatMap { Array(repeating: $0[0], count: $0[1]) }
    var memo = [String: Int]() 

    func dp(_ r: Int, _ f: Int) -> Int {
        let key = "\(r),\(f)"
        
        if r == robot.count { return 0 }
        if f == factory.count { return Int(1e12) }
        if let value = memo[key] { return value }

        let skip = dp(r, f + 1)
        let take = abs(robot[r] - factory[f]) + dp(r + 1, f + 1)
        let result = min(skip, take)
        
        memo[key] = result
        return result
    }
    
    return dp(0, 0)
}

print(minimumTotalDistance([0,4,6], [[2,2],[6,2]]))
print(minimumTotalDistance([1,-1], [[-2,1],[2,1]]))