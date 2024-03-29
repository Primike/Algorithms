// There are n cars going to the same destination along a one-lane road. 
// The destination is target miles away.
// You are given two integer array position and speed, both of length n, 
// where position[i] is the position of the ith car and 
// speed[i] is the speed of the ith car (in miles per hour).
// Return the number of car fleets that will arrive at the destination.

func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    var cars = [(Int, Double)]()
    
    for i in 0..<position.count {
        let time = Double(target - position[i]) / Double(speed[i])
        cars.append((position[i], time))
    }

    cars.sort { $0 > $1 }

    var result = 0
    var i = 0

    while i < cars.count {
        let currentTime = cars[i].1

        while i < cars.count, currentTime >= cars[i].1 {
            i += 1
        }

        result += 1
    }

    return result
}

print(carFleet(12, [10,8,0,5,3], [2,4,1,1,3]))
print(carFleet(10, [3], [3]))
print(carFleet(100, [0,2,4], [4,2,1]))


func carFleet2(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    var cars = [(position: Int, time: Double)]()

    for (x, v) in zip(position, speed) {
        cars.append((x, Double(target - x) / Double(v)))
    }

    cars.sort(by: { $0.position > $1.position })

    var fleets = 0
    var previousTime = 0.0

    for car in cars {
        if car.time > previousTime {
            fleets += 1
            previousTime = car.time
        }
    }

    return fleets
}

func carFleet3(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    var times = Array(repeating: 0.0, count: target)

    for i in 0..<position.count {
        times[position[i]] = Double(target - position[i]) / Double(speed[i])
    }

    var result = [Double]()

    for time in times.reversed() {
        if time == 0 { continue }
        
        if let last = result.last, last >= time { continue }
        
        result.append(time)
    }

    return result.count
}