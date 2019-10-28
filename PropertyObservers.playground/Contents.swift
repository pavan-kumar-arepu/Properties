import UIKit

var str = "Example on Property Observers"

//Knowledge: “The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass initializer has been called.”

//Excerpt From: Apple Inc. “The Swift Programming Language (Swift 5.1)”. Apple Books.


class StepCounter
{
    var longSteps: Int = 0
    {
        willSet{
            print("Newly entered small steps are \(newValue)")
        }
    }
    var smallSteps: Int = 0
    {
        willSet(newTotalSteps)
        {
            print("Newly entered small steps are :",newTotalSteps)
        }
        
        didSet
        {
            if smallSteps > oldValue
            {
                print("Old Value \(oldValue) steps")
                print("Diff  \(smallSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.longSteps = 10

stepCounter.smallSteps = 20

stepCounter.longSteps = 30

stepCounter.smallSteps = 60


