// There are gas stations along the way. The gas stations are represented as an 
// array stations where stations[i] = [positioni, fueli] indicates that the 
// ith gas station is positioni miles east of the starting position 
// and has fueli liters of gas.
// Return the minimum number of refueling stops the car must make in order to 
// reach its destination. If it cannot reach the destination, return -1.

func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
    var heap = Heap<Int>(type: .maxHeap)
    var fuel = startFuel 
    var result = 0
    var i = 0

    while fuel < target {
        while i < stations.count, stations[i][0] <= fuel {
            heap.push(stations[i][1])
            i += 1
        }

        if heap.isEmpty { return -1 }

        fuel += heap.pop()!
        result += 1
    }

    return result
}

print(minRefuelStops(1, 1, []))
print(minRefuelStops(100, 1, [[10,100]]))
print(minRefuelStops(100, 10, [[10,60],[20,30],[30,30],[60,40]]))