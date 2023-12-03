// Choose 2 distinct names from ideas, call them ideaA and ideaB.
// Swap the first letters of ideaA and ideaB with each other.
// If both of the new names are not found in the original ideas, 
// then the name ideaA ideaB (the concatenation of ideaA and ideaB, 
// separated by a space) is a valid company name.
// Otherwise, it is not a valid name.
// Return the number of distinct valid names for the company.

func distinctNames(_ ideas: [String]) -> Int {
    var ideas = ideas.map { Array($0) }
    var dict = [Character: Set<String>]()

    for word in ideas {
        let suffix = String(word[1...])
        dict[word[0], default: []].insert(suffix)
    }

    var result = 0

    for l1 in dict.keys {
        for l2 in dict.keys {
            if l1 == l2 { continue }

            var intersect = 0

            for suffix in dict[l1, default: []] {
                if dict[l2, default: []].contains(suffix) { intersect += 1 }
            }

            let count1 = dict[l1, default: []].count - intersect
            let count2 = dict[l2, default: []].count - intersect
            result += count1 * count2
        }
    }

    return result
}

print(distinctNames(["coffee","donuts","time","toffee"]))
print(distinctNames(["lack","back"]))