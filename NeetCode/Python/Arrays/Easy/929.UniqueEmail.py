#Given an array of strings emails where we send one email to each emails[i], 
#return the number of different addresses that actually receive mails.

def numUniqueEmails(emails):
    hash_set = set()

    for email in emails:
        local, domain = email.split('@')
        local = local.split('+')[0]
        local = local.replace('.', '')
        hash_set.add((local, domain))

    return len(hash_set)

print(numUniqueEmails(["test.email+alex@leetcode.com",
                       "test.e.mail+bob.cathy@leetcode.com",
                       "testemail+david@lee.tcode.com"]))

print(numUniqueEmails(["a@leetcode.com",
                       "b@leetcode.com",
                       "c@leetcode.com"]))