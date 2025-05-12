// After merging the accounts, return the accounts in the following format: 
// the first element of each account is the name, and the rest of the elements 
// are emails in sorted order. 
// The accounts themselves can be returned in any order.

// Also dfs
func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var root = Array(0..<accounts.count)
    var rank = Array(repeating: 1, count: accounts.count)

    func getRoot(_ node: Int) -> Int {
        var node = root[node]

        while node != root[node] {
            root[node] = root[root[node]]
            node = root[node]
        }

        return node
    }

    func mergeRoots(_ n1: Int, _ n2: Int) {
        let p1 = getRoot(n1), p2 = getRoot(n2)

        if p1 == p2 { return }

        if rank[p1] >= rank[p2] { 
            root[p2] = p1
            rank[p1] += rank[p2]
        } else {
            root[p1] = p2
            rank[p2] += rank[p1]
        }
    }

    var emailToAccountId = [String: Int]()

    for (i, account) in accounts.enumerated() {
        for email in account[1...] {
            if let j = emailToAccountId[email] {
                mergeRoots(i, j)
            } else {
                emailToAccountId[email] = i
            }
        }
    }

    var accountIdEmails = [Int: [String]]()
    
    for (email, id) in emailToAccountId {
        accountIdEmails[getRoot(id), default: []].append(email)
    }

    return accountIdEmails.map { (key, emails) in [accounts[key][0]] + emails.sorted() }
}

print(accountsMerge([
    ["John","johnsmith@mail.com","john_newyork@mail.com"],
    ["John","johnsmith@mail.com","john00@mail.com"],
    ["Mary","mary@mail.com"],
    ["John","johnnybravo@mail.com"]]))
print(accountsMerge([
    ["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],
    ["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],
    ["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],
    ["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],
    ["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]))


func accountsMerge2(_ accounts: [[String]]) -> [[String]] {
    var neighbors = [String: [String]]()

    for account in accounts {
        for i in 2..<account.count {
            neighbors[account[1], default: []].append(account[i])
            neighbors[account[i], default: []].append(account[1])
        }
    }

    var visited = Set<String>()

    func dfs(_ email: String) -> [String] {
        if visited.contains(email) { return [] }

        visited.insert(email)
        var emails = [email]

        for next in neighbors[email, default: []] {
            emails += dfs(next)
        }

        return emails
    }

    var result = [[String]]()

    for account in accounts {
        if visited.contains(account[1]) { continue }
        result.append([account[0]] + dfs(account[1]).sorted())
    }

    return result
}