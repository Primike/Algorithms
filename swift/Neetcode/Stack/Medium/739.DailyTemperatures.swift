//Given an array of integers temperatures represents the daily temperatures, 
//return an array answer such that answer[i] is 
//the number of days you have to wait after the ith day to get a warmer temperature. 
//If there is no future day for which this is possible, keep answer[i] == 0 instead.

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var stack = [(i: Int, temp: Int)]()
    var result = Array(repeating: 0, count: temperatures.count)

    for (i, temp) in temperatures.enumerated() {
        while let last = stack.last, temp > last.temp {
            guard let info = stack.popLast() else { continue }
            result[info.i] = i - info.i
        }

        stack.append((i: i, temp: temp))
    }

    return result
}

print(dailyTemperatures([73,74,75,71,69,72,76,73]))
print(dailyTemperatures([30,40,50,60]))
print(dailyTemperatures([30,60,90]))