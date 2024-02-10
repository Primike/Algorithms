// Return the maximum number of monsters that you can eliminate before you lose, 
// or n if you can eliminate all the monsters before they reach the city.

// Time: O(n * logn), Space: O(n)
func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
    var time = [Double]()

    for i in 0..<dist.count {
        time.append(Double(dist[i]) / Double(speed[i]))
    }

    time.sort()
    var result = 0

    for i in 0..<time.count {
        if time[i] <= Double(i) { return result }
        
        result += 1
    }

    return result
}

print(eliminateMaximum([1,3,4], [1,1,1]))
print(eliminateMaximum([1,1,2,3], [1,1,1,1]))
print(eliminateMaximum([3,2,4], [5,3,2]))