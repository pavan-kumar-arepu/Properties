import UIKit

var str = "Example on PropertyWrapper"

//Knowledge : “A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property. For example, if you have properties that provide thread-safety checks or store their underlying data in a database, you have to write that code on every property. When you use a property wrapper, you write the management code once when you define the wrapper, and then reuse that management code by applying it to multiple properties.”


//Example 1:
@propertyWrapper
struct AddressingWithRespect
{
    private var name = "Pavan"
    var wrappedValue: String{
        get {return name}
        set {name = "Respected Mr \(newValue)"}
    }
}

struct SmallFamily{
    @AddressingWithRespect var sonName: String
}

var smallFamily = SmallFamily()

print(smallFamily.sonName)

smallFamily.sonName = "Kumar"

print(smallFamily.sonName)

//Example 2:

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}


struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12”

//Excerpt From: Apple Inc. “The Swift Programming Language (Swift 5.1)”. Apple Books.
