// Given a string path, which is an absolute path (starting with a slash '/') 
// to a file or directory in a Unix-style file system, convert it to the 
// simplified canonical path.

func simplifyPath(_ path: String) -> String {
    let path = path.components(separatedBy: "/")
    var result = [String]()

    for item in path {
        if item == "." || item == "" {
            continue
        } else if item == ".." {
            if !result.isEmpty { result.removeLast() }
        } else {
            result.append(item)
        }
    }
    
    return "/" + result.joined(separator: "/")
}

print(simplifyPath("/home/"))
print(simplifyPath("/../"))
print(simplifyPath("/home//foo/"))