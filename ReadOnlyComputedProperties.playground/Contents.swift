import UIKit

var str = "Example of Read-Only Computed Properties"

//Knowledge: You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value is not fixed. The let keyword is only used for constant properties, to indicate that their values cannot be changed once they are set as part of instance initialization.”

//Excerpt From: Apple Inc. “The Swift Programming Language (Swift 5.1)”. Apple Books.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0 , intensity = 0.0
    var volume1: Double {
        return width * height * depth
    }
    
    var volume2: Double {
        return width * height * depth * width * height * depth * intensity
    }
}
let Cuboid1 = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of Cuboid1 is \(Cuboid1.volume1)")
// Prints "the volume of fourByFiveByTwo is 40.0”

let Cuboid2 = Cuboid(width: 3.0, height: 2.0, depth: 2.0, intensity: 2.5)
print("the volume of Cuboid2 is \(Cuboid2.volume2)")
