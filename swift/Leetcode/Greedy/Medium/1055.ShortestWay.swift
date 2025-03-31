// Given two strings source and target, return the minimum number 
// of subsequences of source such that their concatenation equals target. 
// If the task is impossible, return -1.

// Time: O(n * s), Space: O(1)
func shortestWay(_ source: String, _ target: String) -> Int {
    let source = Array(source), target = Array(target)
    var result = 0
    var i = 0

    while i < target.count {
        let startingIndex = i

        for letter in source {
            if i < target.count, letter == target[i] { i += 1 }
        }

        if startingIndex == i { return -1 }

        result += 1
    }

    return result
}

print(shortestWay("abc", "abcbc"))
print(shortestWay("abc", "acdbc"))
print(shortestWay("xyz", "xzyxz"))