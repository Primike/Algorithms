// There are n cars going to the same destination along a one-lane road. 
// The destination is target miles away.
// You are given two integer array position and speed, both of length n, 
// where position[i] is the position of the ith car and 
// speed[i] is the speed of the ith car (in miles per hour).
// Return the number of car fleets that will arrive at the destination.

func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    var array = Array(repeating: (x: 0, v: 0.0), count: target)

    for i in 0..<position.count {
        array[position[i]] = (x: position[i], v: Double(speed[i]))
    }

    var lastTime = 0.0
    var result = 0

    for car in array.reversed() {
        if car.v == 0 {
            continue
        }

        let time = Double(target - car.x) / car.v
        if time > lastTime {
            lastTime = time
            result += 1
        }
    }

    return result
}

print(carFleet(12, [10,8,0,5,3], [2,4,1,1,3]))
print(carFleet(10, [3], [3]))
print(carFleet(100, [0,2,4], [4,2,1]))