import UIKit

var str = "Example of Lazy, Modifer"

//Knowledge: Why ‘Lazy’ keywoard applicable only for Variable and why not constants?

//  You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.”

//When do you need Lazy Loading?

//Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete. Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is needed.


class ComplexDataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    //'lazy' keyword is a modifier
    lazy var dataImporter  = ComplexDataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

// the ComplexDataImporter instance for the 'dataImporter' property has not yet been created

print(manager.dataImporter.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt”
