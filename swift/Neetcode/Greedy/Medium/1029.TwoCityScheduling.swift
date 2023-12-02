// A company is planning to interview 2n people. Given the array costs 
// where costs[i] = [aCosti, bCosti], the cost of flying the ith person to 
// city a is aCosti, and the cost of flying the ith person to city b is bCosti.
// Return the minimum cost to fly every person to a city such that exactly 
// n people arrive in each city.

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var cities = [(Int, Int, Int)]()

    for cost in costs {
        cities.append((cost[1] - cost[0], cost[0], cost[1]))
    }

    cities.sort { $0.0 < $1.0 }
    var result = 0

    for i in 0..<cities.count {
        if i < cities.count / 2 {
            result += cities[i].2
        } else {
            result += cities[i].1
        }
    }

    return result
}

print(twoCitySchedCost([[10,20],[30,200],[400,50],[30,20]]))
print(twoCitySchedCost([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]]))
print(twoCitySchedCost([[515,563],[451,713],[537,709],[343,819],[855,779],[457,60],[650,359],[631,42]]))