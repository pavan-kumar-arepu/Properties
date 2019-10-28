import UIKit

var str = "Example on PropertyWrapper with Custom Initializer"

//Knowledge:To support setting an initial value or other customization, the property wrapper needs to add an initializer. Here’s an expanded version of TwelveOrLess called SmallNumber that defines initializers that set the wrapped and maximum value:

//Create a wrapper with custome initializers

@propertyWrapper
struct SmallNumber
{
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}


//Usecase1: Calling default init

//Comsuming the above PropertyWrapper

struct ZeroRectangle
{
    @SmallNumber var height : Int
    @SmallNumber var width : Int
}

var zeroRect = ZeroRectangle()
print ("zeroRect Height and Width are: ", zeroRect.height, zeroRect.width)
//print "0 0"


//Usecase2: Calling 'init(wrappedValue: Int)' of 'SmallNumber' PropertyWrapper

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// Prints "1 1”




//UseCase3: Calling 'init(wrappedValue: Int, maximum: Int)' of 'SmallNumber' PropertyWrapper


struct NarrowRectangle
{
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// Prints "2 3"


//UseCase4: Calling default 'setter' of 'SmallNumber' PropertyWrapper

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// Prints "5 4”

//Excerpt From: Apple Inc. “The Swift Programming Language (Swift 5.1)”. Apple Books.
