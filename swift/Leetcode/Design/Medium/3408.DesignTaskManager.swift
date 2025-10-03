struct Task: Comparable, Hashable {
    let priority: Int
    let taskId: Int
    let userId: Int

    static func < (lhs: Task, rhs: Task) -> Bool {
        if lhs.priority != rhs.priority {
            return lhs.priority < rhs.priority
        }
        if lhs.taskId != rhs.taskId {
            return lhs.taskId < rhs.taskId
        }
        return lhs.userId < rhs.userId
    }
}

class TaskManager {
    private var taskDetails: [Int: (userId: Int, priority: Int)] = [:]
    private var priorityTasks: Heap<Task>
    private var staleTasks: [Task: Int] = [:]

    init(_ tasks: [[Int]]) {
        self.priorityTasks = Heap<Task>(.maxHeap)
        for t in tasks {
            let userId = t[0], taskId = t[1], priority = t[2]
            taskDetails[taskId] = (userId, priority)
            priorityTasks.push(Task(priority: priority, taskId: taskId, userId: userId))
        }
    }

    func add(_ userId: Int, _ taskId: Int, _ priority: Int) {
        taskDetails[taskId] = (userId, priority)
        priorityTasks.push(Task(priority: priority, taskId: taskId, userId: userId))
    }

    func edit(_ taskId: Int, _ newPriority: Int) {
        guard let details = taskDetails[taskId] else { return }
        
        let oldTask = Task(priority: details.priority, taskId: taskId, userId: details.userId)
        staleTasks[oldTask, default: 0] += 1
        
        let newTask = Task(priority: newPriority, taskId: taskId, userId: details.userId)
        taskDetails[taskId] = (details.userId, newPriority)
        priorityTasks.push(newTask)
    }

    func rmv(_ taskId: Int) {
        guard let details = taskDetails.removeValue(forKey: taskId) else { return }
        let oldTask = Task(priority: details.priority, taskId: taskId, userId: details.userId)
        staleTasks[oldTask, default: 0] += 1
    }

    func execTop() -> Int {
        while let topTask = priorityTasks.pop() {
            if staleTasks[topTask, default: 0] > 0 {
                staleTasks[topTask]! -= 1
                continue
            }
            
            taskDetails.removeValue(forKey: topTask.taskId)
            return topTask.userId
        }
        return -1
    }
}