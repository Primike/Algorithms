// There is a car with capacity empty seats. The vehicle only drives east 
// (i.e., it cannot turn around and drive west).
// Return true if it is possible to pick up and drop off all passengers 
// for all the given trips, or false otherwise.

// Time: O(n * logn), Space: O(n)
func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
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

print(carPooling([[2,1,5],[3,3,7]], 4))
print(carPooling([[2,1,5],[3,3,7]], 5))