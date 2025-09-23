class Solution {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        let langSets = languages.map { Set($0) }
        var problemUsers = Set<Int>()

        for friendship in friendships {
            let u = friendship[0] - 1
            let v = friendship[1] - 1

            if langSets[u].isDisjoint(with: langSets[v]) {
                problemUsers.insert(u)
                problemUsers.insert(v)
            }
        }

        if problemUsers.isEmpty {
            return 0
        }

        var langFrequency: [Int: Int] = [:]
        for userIndex in problemUsers {
            for lang in languages[userIndex] {
                langFrequency[lang, default: 0] += 1
            }
        }

        let maxFreq = langFrequency.values.max() ?? 0
        return problemUsers.count - maxFreq
    }
}