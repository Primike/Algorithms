// After merging the accounts, return the accounts in the following format: 
// the first element of each account is the name, and the rest of the elements 
// are emails in sorted order. 
// The accounts themselves can be returned in any order.

func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var root = Array(0..<accounts.count)
    var rank = Array(repeating: 1, count: accounts.count)

    func getRoot(_ n: Int) -> Int {
        var n = root[n]

        while n != root[n] {
            root[n] = root[root[n]]
            n = root[n]
        }

        return n
    }

    func mergeRoots(_ n1: Int, _ n2: Int) -> Bool {
        let p1 = getRoot(n1), p2 = getRoot(n2)

        if p1 == p2 { return false }

        if rank[p1] >= rank[p2] { 
            root[p2] = p1
            rank[p1] += rank[p2]
        } else {
            root[p1] = p2
            rank[p2] += rank[p1]
        }

        return true
    }

    var emailToAccount = [String: Int]()

    for (i, account) in accounts.enumerated() {
        for email in account[1...] {
            if let index = emailToAccount[email] {
                mergeRoots(i, index)
            } else {
                emailToAccount[email] = i
            }
        }
    }

    var emailGroup = [Int: [String]]()
    
    for (email, i) in emailToAccount {
        emailGroup[getRoot(i), default: []].append(email)
    }

    var result = [[String]]()

    for (i, emails) in emailGroup {
        result.append([accounts[i][0]] + emails.sorted())
    }

    return result
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