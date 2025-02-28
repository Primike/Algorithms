// Given a list of folders folder, return the folders after 
// removing all sub-folders in those folders. You may return the answer in any order.
// For example, "/a/b" is a sub-folder of "/a", but "/b" is not a sub-folder of "/a/b/c".

// Time: O(n * l * log(n)), Space: O(n * l)
func removeSubfolders(_ folder: [String]) -> [String] {
    var folder = folder.sorted()
    var result = [folder[0]]

    for i in 1..<folder.count {
        var lastFolder = result.last! + "/"
        
        if !folder[i].hasPrefix(lastFolder) {
            result.append(folder[i])
        }
    }
    
    return result
}

print(removeSubfolders('["/a","/a/b","/c/d","/c/d/e","/c/f"]'))
print(removeSubfolders('["/a","/a/b/c","/a/b/d"]'))
print(removeSubfolders('["/a/b/c","/a/b/ca","/a/b/d"]'))


// Time: O(n * l + n * l^2), Space: O(n * ls)
func removeSubfolders2(_ folder: [String]) -> [String] {
    var folderSet = Set(folder)
    var result = [String]()

    for path in folder {
        var current = ""

        for char in path {
            if folderSet.contains(current), char == "/" { break }
            current.append(char)
        }

        if current == path { result.append(path) }
    }

    return result
}