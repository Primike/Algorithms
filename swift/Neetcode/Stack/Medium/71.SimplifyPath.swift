// Given a string path, which is an absolute path (starting with a slash '/') 
// to a file or directory in a Unix-style file system, convert it to the 
// simplified canonical path.

// Time: O(n), Space: O(n)
func simplifyPath(_ path: String) -> String {
    let path = path.components(separatedBy: "/").filter { $0 != "" }
    var stack = [String]()

    for string in path {
        if string == ".." {
            if !stack.isEmpty { stack.removeLast() }
        } else if string != "." {
            stack.append(string)
        }
    }

    return "/" + stack.joined(separator: "/")
}

print(simplifyPath("/home/"))
print(simplifyPath("/../"))
print(simplifyPath("/home//foo/"))