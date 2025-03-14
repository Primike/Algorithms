// Check if the substring sources[i] occurs at index indices[i] in the original string s.
// If it does not occur, do nothing.
// Otherwise if it does occur, replace that substring with targets[i].
// Return the resulting string after performing all replacement operations on s.

// Time: O(n * log(n)), Space: O(n)
func findReplaceString(_ s: String, _ indices: [Int], _ sources: [String], _ targets: [String]) -> String {
    var info = [(Int, String, String)]()

    for i in 0..<indices.count {
        info.append((indices[i], sources[i], targets[i]))
    }

    info.sort { $0.0 < $1.0 }
    let s = Array(s)
    var result = ""
    var i = 0, j = 0

    while i < s.count {
        if j >= info.count || i < info[j].0 {
            result += String(s[i])
            i += 1
        } else {
            let string = String(s[i..<(min(i + info[j].1.count, s.count))])

            if string == info[j].1 { 
                result += info[j].2 
                i += string.count
            }

            j += 1
        }
    }

    return result
}

print(findReplaceString("abcd", [0, 2], ["a", "cd"], ["eee", "ffff"]))
print(findReplaceString("abcd", [0, 2], ["ab","ec"], ["eee","ffff"]))