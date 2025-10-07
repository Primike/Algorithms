class Solution {
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        var logs: [(user: String, time: Int, site: String)] = []
        for i in 0..<username.count {
            logs.append((user: username[i], time: timestamp[i], site: website[i]))
        }
        
        logs.sort {
            if $0.user != $1.user {
                return $0.user < $1.user
            }
            return $0.time < $1.time
        }
        
        var userVisits = [String: [String]]()
        for log in logs {
            userVisits[log.user, default: []].append(log.site)
        }
        
        var patternCounts = [[String]: Int]()
        for (_, sites) in userVisits {
            guard sites.count >= 3 else { continue }
            
            var userUniquePatterns = Set<[String]>()
            for i in 0..<(sites.count - 2) {
                for j in (i + 1)..<(sites.count - 1) {
                    for k in (j + 1)..<sites.count {
                        userUniquePatterns.insert([sites[i], sites[j], sites[k]])
                    }
                }
            }
            
            for pattern in userUniquePatterns {
                patternCounts[pattern, default: 0] += 1
            }
        }
        
        let sortedPatterns = patternCounts.sorted {
            if $0.value != $1.value {
                return $0.value > $1.value
            }
            return $0.key.lexicographicallyPrecedes($1.key)
        }
        
        return sortedPatterns.first?.key ?? []
    }
}