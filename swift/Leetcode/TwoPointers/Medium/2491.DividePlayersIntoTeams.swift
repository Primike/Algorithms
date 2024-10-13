func dividePlayers(_ skill: [Int]) -> Int {
    if skill.count % 2 != 0 { return -1 }

    let skill = skill.sorted()
    let targetSkill = skill[0] + skill[skill.count - 1]
    var result = 0
    var left = 0, right = skill.count - 1

    while left < right {
        if skill[left] + skill[right] != targetSkill { return -1 }

        result += skill[left] * skill[right]
        left += 1 
        right -= 1
    }

    return result
}