class Solution {
    func peopleAwareOfSecret(_ n: Int, _ delay: Int, _ forget: Int) -> Int {
        let mod = 1_000_000_007
        
        var queue = [Int]()
        queue.append(1)
        
        var sharingCount = 0

        for day in 2...n {
            if queue.count >= forget {
                let forgottenCount = queue.removeFirst()
                sharingCount = (sharingCount - forgottenCount + mod) % mod
            }
            
            if queue.count >= delay {
                sharingCount = (sharingCount + queue[queue.count - delay]) % mod
            }
            
            let newPeopleToday = sharingCount
            queue.append(newPeopleToday)
        }

        var totalPeople = 0
        for count in queue {
            totalPeople = (totalPeople + count) % mod
        }
        
        return totalPeople
    }
}