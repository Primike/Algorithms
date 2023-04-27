//Given an array of strings emails where we send one email to each emails[i], 
//return the number of different addresses that actually receive mails.

func numUniqueEmails(_ emails: [String]) -> Int {
    //tuples not hashable since they could be different types
    //Contstant time lookup with Hashable
    struct Email: Hashable {
        var local: String
        var domain: String
    }

    var hashSet = Set<Email>()

    for email in emails {
        let parts = email.split(separator: "@")
        var local = String(parts[0])
        let domain = String(parts[1])
        
        //when performing some operations like split String turns to Substring
        local = String(local.split(separator: "+")[0])
        local = local.replacingOccurrences(of: ".", with: "")
        
        hashSet.insert(Email(local: local, domain: domain))
    }

    return hashSet.count
}

print(numUniqueEmails(["test.email+alex@leetcode.com",
                       "test.e.mail+bob.cathy@leetcode.com",
                       "testemail+david@lee.tcode.com"]))

print(numUniqueEmails(["a@leetcode.com",
                       "b@leetcode.com",
                       "c@leetcode.com"]))