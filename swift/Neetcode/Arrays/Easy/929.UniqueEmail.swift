// Given an array of strings emails where we send one email to each emails[i], 
// return the number of different addresses that actually receive mails.

func numUniqueEmails(_ emails: [String]) -> Int {
    var emailSet = Set<String>()

    for email in emails {
        let separated = email.components(separatedBy: "@")
        let local = separated[0].components(separatedBy: "+")
        let newLocal = local[0].filter { $0 != "." }
        let domain = separated[1]

        emailSet.insert(newLocal + "@" + domain)
    }

    return emailSet.count
}

print(numUniqueEmails(["test.email+alex@leetcode.com",
                       "test.e.mail+bob.cathy@leetcode.com",
                       "testemail+david@lee.tcode.com"]))

print(numUniqueEmails(["a@leetcode.com",
                       "b@leetcode.com",
                       "c@leetcode.com"]))