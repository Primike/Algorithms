// You have to form a team of 3 soldiers amongst them under the following rules:
// Choose 3 soldiers with index (i, j, k) with rating (rating[i], rating[j], rating[k]).
// A team is valid if: (rating[i] < rating[j] < rating[k]) 
// or (rating[i] > rating[j] > rating[k]) where (0 <= i < j < k < n).
// Return the number of teams you can form given the conditions. 
// (soldiers can be part of multiple teams).

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

print(numTeams([2,5,3,4,1]))
print(numTeams([2,1,3]))
print(numTeams([1,2,3,4]))