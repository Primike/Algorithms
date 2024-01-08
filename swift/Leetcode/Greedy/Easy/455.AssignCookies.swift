// Assume you are an awesome parent and want to give your children some cookies. 
// But, you should give each child at most one cookie.
// Each child i has a greed factor g[i], which is the minimum size of a cookie 
// that the child will be content with; and each cookie j has a size s[j]. 
// If s[j] >= g[i], we can assign the cookie j to the child i, and the child i 
// will be content. Your goal is to maximize the number of your content children 
// and output the maximum number.

// Time: O(n * logn), Space: O(1)
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    let g = g.sorted(), s = s.sorted()
    var result = 0
    var j = 0 

    for child in g {
        while j < s.count, s[j] < child {
            j += 1
        }

        result += j < s.count ? 1 : 0
        j += 1
    }

    return result
}


print(findContentChildren([1,2,3], [1,1]))
print(findContentChildren([1,2], [1,2,3]))