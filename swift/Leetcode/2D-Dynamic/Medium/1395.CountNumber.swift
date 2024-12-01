// You have to form a team of 3 soldiers amongst them under the following rules:
// Choose 3 soldiers with index (i, j, k) with rating (rating[i], rating[j], rating[k]).
// A team is valid if: (rating[i] < rating[j] < rating[k]) 
// or (rating[i] > rating[j] > rating[k]) where (0 <= i < j < k < n).
// Return the number of teams you can form given the conditions. 
// (soldiers can be part of multiple teams).

// Time: O(n^2), Space: O(n)
func numTeams(_ rating: [Int]) -> Int {
    if rating.count < 3 { return 0 }

    var increasing = Array(repeating: Array(repeating: 0, count: 3), count: rating.count)
    var decreasing = Array(repeating: Array(repeating: 0, count: 3), count: rating.count)
    var result = 0

    for i in 0..<rating.count {
        for j in 0..<i {
            if rating[j] < rating[i] {
                increasing[i][2] += increasing[j][1]
                increasing[i][1] += 1          
            }
            
            if rating[j] > rating[i] {
                decreasing[i][2] += decreasing[j][1] 
                decreasing[i][1] += 1        
            }
        }

        result += increasing[i][2] + decreasing[i][2]
    }

    return result
}

print(numTeams([2,5,3,4,1]))
print(numTeams([2,1,3]))
print(numTeams([1,2,3,4]))


func numTeams(_ rating: [Int]) -> Int {
    var memo = [String: Int]()

    func dp(_ index: Int, _ soldiers: Int, _ isIncreasing: Bool) -> Int {
        let key = "\(index),\(soldiers),\(isIncreasing)"

        if soldiers == 3 { return 1 }
        if index == rating.count { return 0 }
        if let value = memo[key] { return value }

        var total = 0

        for i in (index + 1)..<rating.count {
            if isIncreasing, rating[index] >= rating[i] { continue }
            if !isIncreasing, rating[index] <= rating[i] { continue }
            total += dp(i, soldiers + 1, isIncreasing)
        }

        memo[key] = total
        return total
    }

    var result = 0

    for i in 0..<rating.count {
        result += dp(i, 1, true)
        result += dp(i, 1, false)
    }

    return result
}

// Time: O(n^3), Space: O(1)
func numTeams(_ rating: [Int]) -> Int {
    var result = 0

    for i in 0..<rating.count - 2 {
        for j in i..<rating.count - 1 {
            for k in j..<rating.count {
                if rating[i] > rating[j], rating[j] > rating[k] { result += 1 }
                if rating[i] < rating[j], rating[j] < rating[k] { result += 1 }
            }
        }
    }

    return result
}