// There is a car with capacity empty seats. The vehicle only drives east 
// (i.e., it cannot turn around and drive west).
// Return true if it is possible to pick up and drop off all passengers 
// for all the given trips, or false otherwise.

func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    var timeline = [(Int, Int)]()

    for trip in trips {
        let (num, start, end) = (trip[0], trip[1], trip[2])
        timeline.append((start, num))
        timeline.append((end, -num))
    }

    timeline.sort { $0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1) }
    var currentPassengers = 0

    for event in timeline {
        currentPassengers += event.1
        if currentPassengers > capacity { return false }
    }
    return true
}

print(carPooling([[2,1,5],[3,3,7]], 4))
print(carPooling([[2,1,5],[3,3,7]], 5))