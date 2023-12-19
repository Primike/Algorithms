// Given two strings needle and haystack, 
// return the index of the first occurrence of needle in haystack, or -1 
// if needle is not part of haystack.
// KMP

func strStr(_ haystack: String, _ needle: String) -> Int {
    var haystack = haystack

    for i in 0..<haystack.count {
        if haystack.hasPrefix(needle) { return i }
        
        haystack = String(haystack.dropFirst())
    }

    return -1
}

print(strStr("sadbutsad", "sad"))
print(strStr("leetcode", "leeto"))