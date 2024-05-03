// Version numbers consist of one or more revisions joined by a dot '.'. 
// Each revision consists of digits and may contain leading zeros. 
// Every revision contains at least one character. 
// Revisions are 0-indexed from left to right, with the leftmost revision 
// being revision 0, the next revision being revision 1, and so on. 
// For example 2.5.33 and 0.1 are valid version numbers.
// If version1 < version2, return -1.
// If version1 > version2, return 1.
// Otherwise, return 0.

// Time: O(n), Space: O(n)
func compareVersion(_ version1: String, _ version2: String) -> Int {
    let version1 = version1.split(separator: ".").map { Int($0) ?? 0 }
    let version2 = version2.split(separator: ".").map { Int($0) ?? 0 }
    let smallestIndex = min(version1.count, version2.count)

    for i in 0..<smallestIndex {
        if version1[i] > version2[i] { return 1 }
        if version1[i] < version2[i] { return -1 }
    }

    let remaining1 = version1[smallestIndex...].filter { $0 != 0 }.count
    let remaining2 = version2[smallestIndex...].filter { $0 != 0 }.count

    if remaining1 == 0, remaining2 == 0 { return 0 }
    return version1.count > version2.count ? 1 : -1
}

print(compareVersion("1.01", "1.001"))
print(compareVersion("1.0", "1.0.0"))
print(compareVersion("0.1", "1.1"))