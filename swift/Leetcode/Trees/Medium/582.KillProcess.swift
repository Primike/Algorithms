class Solution {
    func killProcess(_ pid: [Int], _ ppid: [Int], _ kill: Int) -> [Int] {
        var map = [Int: [Int]]()
        for i in 0..<ppid.count {
            let parent = ppid[i]
            if parent > 0 {
                map[parent, default: []].append(pid[i])
            }
        }
        
        var result = [Int]()
        var queue = [kill]
        var head = 0
        
        while head < queue.count {
            let r = queue[head]
            head += 1
            result.append(r)
            
            if let children = map[r] {
                queue.append(contentsOf: children)
            }
        }
        
        return result
    }
}