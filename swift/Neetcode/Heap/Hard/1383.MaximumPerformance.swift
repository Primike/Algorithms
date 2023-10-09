// Choose at most k different engineers out of the n engineers to form 
// a team with the maximum performance.
// Return the maximum performance of this team.

//Time: nlog(n), Space(n)
func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
    var engineers = [(Int, Int)]()

    for i in 0..<speed.count {
        engineers.append((speed[i], efficiency[i]))
    }

    engineers.sort { $0.1 > $1.1 }
    var heap = Heap<Int>(type: .minHeap)
    var result = 0
    var currentSum = 0

    for (speed, efficiency) in engineers {
        currentSum += speed
        heap.push(speed)

        if heap.count > k {
            let minimum = heap.pop()!
            currentSum -= minimum
        }
        
        result = max(result, currentSum * efficiency)
    }

    return result % (Int(pow(10, 9.0)) + 7)
}