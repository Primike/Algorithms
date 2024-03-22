// Design a logger system that receives a stream of messages 
// along with their timestamps. Each unique message should 
// only be printed at most every 10 seconds 
// (i.e. a message printed at timestamp t will prevent 
// other identical messages from being printed until timestamp t + 10).

class Logger {

    var dict: [String: Int]

    init() {
        self.dict = [:]    
    }
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let last = dict[message], timestamp < last {
            return false 
        } else {
            dict[message] = timestamp + 10
            return true 
        }
    }
}