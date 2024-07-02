// We want to hire exactly k workers to form a paid group. 
// To hire a group of k workers, we must pay them according to the following rules:
// Every worker in the paid group must be paid at least their minimum wage expectation.
// In the group, each worker's pay must be directly proportional to their quality. 
// This means if a worker’s quality is double that of another worker in the group, 
// then they must be paid twice as much as the other worker.
// Given the integer k, return the least amount of money needed 
// to form a paid group satisfying the above conditions.

func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
    var ratio = [(Double, Double)]()

    for i in 0..<quality.count {
        ratio.append((Double(wage[i]) / Double(quality[i]), Double(quality[i])))
    }
    
    ratio.sort { $0.0 < $1.0 }
    var heap = Heap<Double>(.maxHeap)
    var result = Double.infinity
    var current = 0.0

    for i in 0..<quality.count {
        heap.push(ratio[i].1)
        current += ratio[i].1
        
        if heap.count > k { current -= heap.pop() ?? 0 } 
        if heap.count == k { result = min(result, current * ratio[i].0) }
    }
    
    return result
}

print(mincostToHireWorkers([10,20,5], [70,50,30], 2))
print(mincostToHireWorkers([3,1,10,10,1], [4,8,2,2,7], 3))