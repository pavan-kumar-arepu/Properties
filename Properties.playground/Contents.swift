import UIKit
import PlaygroundSupport

//Knowledge: In its simplest form, a stored property is a constant or variable that is stored as part of an instance of a particular class or structure. Stored properties can be either variable stored properties (introduced by the var keyword) or constant stored properties (introduced by the let keyword).”


struct FixedLengthRange
{
    var firstValue : Int
    let length : Int
}
var rangeOfThreeItemsVar = FixedLengthRange(firstValue: 0, length: 3)
let rangeOfThreeItemsLet = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItemsVar.firstValue = 4

//TODO: If you remove the comment of below line then it will lead to error, becuase 'rangeOfThreeItemsLet' is assigned to 'Let' type
//rangeOfThreeItemsLet.firstValue = 2
