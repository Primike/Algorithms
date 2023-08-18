// Given a string path, which is an absolute path (starting with a slash '/') 
// to a file or directory in a Unix-style file system, convert it to the 
// simplified canonical path.

func simplifyPath(_ path: String) -> String {
    var stack = [String]()

    for i in path.split(separator: "/") {
        let segment = String(i)

        if segment == ".." {
            if !stack.isEmpty { stack.removeLast() }
        } else if segment == "." || segment.isEmpty {
            continue
        } else {
            stack.append(segment)
        }
    }

    let res = "/" + stack.joined(separator: "/")
    return res
}

print(simplifyPath("/home/"))
print(simplifyPath("/../"))
print(simplifyPath("/home//foo/"))