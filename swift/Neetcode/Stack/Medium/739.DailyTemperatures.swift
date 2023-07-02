//Given an array of integers temperatures represents the daily temperatures, 
//return an array answer such that answer[i] is 
//the number of days you have to wait after the ith day to get a warmer temperature. 
//If there is no future day for which this is possible, keep answer[i] == 0 instead.

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var stack = [Int]()
    var result = Array(repeating: 0, count: temperatures.count)

    for (i, temp) in temperatures.enumerated() {
        while let last = stack.last, temp > temperatures[last] { 
            result[last] = i - last 
            stack.removeLast()
        }

        stack.append(i) 
    }

    return result
}

print(dailyTemperatures([73,74,75,71,69,72,76,73]))
print(dailyTemperatures([30,40,50,60]))
print(dailyTemperatures([30,60,90]))