//Given two strings needle and haystack, 
//return the index of the first occurrence of needle in haystack, or -1 
//if needle is not part of haystack.
//KMP

func strStr(_ haystack: String, _ needle: String) -> Int {
    var index = 0
    var haystack = haystack

    while !haystack.isEmpty {
        if haystack.hasPrefix(needle) {
            return index
        } else {
            haystack = String(haystack.dropFirst())
            index += 1
        }
    }

    return -1
}

print(strStr("sadbutsad", "sad"))
print(strStr("leetcode", "leeto"))