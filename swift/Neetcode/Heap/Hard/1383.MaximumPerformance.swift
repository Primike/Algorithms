// Choose at most k different engineers out of the n engineers to form 
// a team with the maximum performance.
// Return the maximum performance of this team.

//Time: nlog(n), Space(n)
func maxPerformance(_ n: Int, _ speed: [Int], _ efficiency: [Int], _ k: Int) -> Int {
    let team = zip(speed, efficiency).map { ($0.0, $0.1) }.sorted { $0.1 > $1.1 }
    var heap = Heap<Int>(.minHeap)
    var result = 0
    var current = 0

    for engineer in team {
        current += engineer.0
        heap.push(engineer.0)

        if heap.count > k { current -= heap.pop()! }

        result = max(result, current * engineer.1)
    }
    
    return result % 1_000_000_007
}