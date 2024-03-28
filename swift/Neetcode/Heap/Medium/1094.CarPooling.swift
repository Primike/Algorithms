// There is a car with capacity empty seats. The vehicle only drives east 
// (i.e., it cannot turn around and drive west).
// Return true if it is possible to pick up and drop off all passengers 
// for all the given trips, or false otherwise.

struct Trip: Comparable {
    let people: Int
    let from: Int
    let to: Int

    static func < (_ l: Trip, _ r: Trip) -> Bool {
        return l.to < r.to
    }
}

func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    var trips = trips.sorted { ($0[1], $0[2]) < ($1[1], $1[2]) }
    var heap = Heap<Trip>(.minHeap)
    var passengers = 0

    for trip in trips {
        passengers += trip[0]

        while let first = heap.peek(), first.to <= trip[1] {
            passengers -= first.people
            heap.pop()
        }

        if passengers > capacity { return false }

        heap.push(Trip(people: trip[0], from: trip[1], to: trip[2]))
    }

    return true
}

print(carPooling([[2,1,5],[3,3,7]], 4))
print(carPooling([[2,1,5],[3,3,7]], 5))


// Time: O(n * logn), Space: O(n)
func carPooling2(_ trips: [[Int]], _ capacity: Int) -> Bool {
    var stations = [(Int, Int)]()

    for trip in trips {
        stations.append((trip[1], trip[0])) 
        stations.append((trip[2], -trip[0]))
    }

    stations.sort { ($0.0, $0.1) < ($1.0, $1.1) }
    var passengers = 0

    for station in stations {
        passengers += station.1
        if passengers > capacity { return false }
    }

    return true
}