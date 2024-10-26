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