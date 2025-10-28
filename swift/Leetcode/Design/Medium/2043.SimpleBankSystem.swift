class Bank {
    var balance: [Int]

    init(_ balance: [Int]) {
        self.balance = balance
    }
    
    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        if account1 > balance.count || 
           account2 > balance.count || 
           balance[account1 - 1] < money {
            return false
        }
        balance[account1 - 1] -= money
        balance[account2 - 1] += money
        return true
    }
    
    func deposit(_ account: Int, _ money: Int) -> Bool {
        if account > balance.count {
            return false
        }
        balance[account - 1] += money
        return true
    }
    
    func withdraw(_ account: Int, _ money: Int) -> Bool {
        if account > balance.count || balance[account - 1] < money {
            return false
        }
        balance[account - 1] -= money
        return true
    }
}