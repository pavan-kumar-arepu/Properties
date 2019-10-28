import UIKit

var str = "Example on 'ProjectedValue' on PropertyWrapper"



//Knowledge : The name of the projected value is the same as the wrapped value, except it begins with a dollar sign ($). Because your code can’t define properties that start with $ the projected value never interferes with properties you define.

@propertyWrapper
struct SmallNumber {
    private var number = 0
    var projectedValue = false
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}

struct ProjectedStructure {
    @SmallNumber var number: Int
}
var someStructure = ProjectedStructure()

someStructure.number = 4
print("value",someStructure.number)
print("value",someStructure.$number)

// Prints "false"

someStructure.number = 55
print("value",someStructure.number)
print("value",someStructure.$number)
// Prints "true"

