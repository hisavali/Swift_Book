// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func simpleValues()
{
    //------------------------------
    /*
    EXPERIMENT
    Create a constant with an explicit type of Float and a value of 4.”
    */
    let v:Float = 4;
    //------------------------------
    
    
    
    //------------------------------
    let label = "Hello"
    let width = 90
    
    let labelWidth = label + String(width)
    /*
    EXPERIMENT
    Try removing the conversion to String from the last line. What error do you get?”
    
    let labelWidth = width + label
    Answer : No overlaoded + found which accepts both kind of arguments.
    */
    //------------------------------
    
    
    
    //------------------------------
    /*
    EXPERIMENT
    Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.”
    */
    
    let floatArg: Float = 5.9
    let arg:Integer = 5
    
    let receiver = "Kamil"
    
    let message = "I am sending \(receiver) amount \(floatArg)"
    //------------------------------
}

func ArrayConstruct()
{
    var occ = [ "M" : "N", "X":"Z"]
    occ["A"] = "B"
    occ["C"] = "D"
    
    let emptyStringArray = String[]()
//    emptyStringArray [0] = 1 // Compilation Error --> Couldn't find overloaded [] to assign RHS value
    emptyStringArray [0] = "1"
}

func DictionaryConstruct()
{
    var emptyDictionary = Dictionary<String, Float> ()
    //let emptyDictionary = Dictionary<String, Float> () // This line doesn't work if empty dictionary is declared as constant. But then why this is working for constant array

    emptyDictionary["A"] = 4

    let emptyArray = []
//    emptyArray[0] = 1 // Compilation Error --> Can't assign

    var teamScore = 0
    for score in [1,2,3,4,5,6,7]{
        if score < 4 {
            teamScore += 1
        }
    }

    print(teamScore)
}

func OptionalValues()
{
    var optionalString: String? = "Hitesh"
    optionalString == nil
    
    var greeting = "Hello"
    if let name = optionalString {
        greeting = "\(greeting), \(optionalString)"
    }

    //------------------------------
    /*
    EXPERIMENT
    Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.”
    */
    optionalString = nil
    if let name1 = optionalString {
        greeting = "Hello, \(optionalString)"
    } else {
        greeting = "Hello, Stranger"
    }
    //------------------------------
}

func SwitchConstruct()
{
    let vegetable = "red pepper"
    
    switch vegetable {
        case "Celery":
            let vegetableComment = "Add some raisns"
        case "Cucumber", "Watercress":
            let vegetableComment = "Make sandwich"
        case let x where x.hasSuffix("pepper"):
            let vegetableComment = "It is spice \(x)"
        default:
            let vegetableComment = "Vegetable"
    }
    
    //------------------------------

    /*EXPERIMENT
    Try removing the default case. What error do you get?”
    */
    
    var vegetableComment :String?
    switch vegetable {
    case "Celery":
        vegetableComment = "Add some raisns"
    case "Cucumber", "Watercress":
        vegetableComment = "Make sandwich"
    case let x where x.hasSuffix("pepper"):
        vegetableComment = "It is spice \(x)"
    default:                                        //Error --> Swich Statement needs to be exhaustive
        vegetableComment = "Vegetable"
    }
    //------------------------------
}

func ForLoopConstruct()
{
    let interstingNumber = ["prime": [3,5,7,11,13,17,19,23,29],
        "Fib":[1,2,3,5,8],
        "Square": [1,4,9,16,25]]
    
    var largest = 0
    
    for (kind, numbers) in interstingNumber {
        for number in numbers {
            if (number > largest){
                largest = number
            }
        }
    }
    largest
    
    //------------------------------
    /* EXPERIMENT
    Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
    */
    
    var (largestKind, largestNum) = ("",0)
    
    for (kind, numbers) in interstingNumber {
        for number in numbers {
            if (number > largestNum){
                (largestKind,largestNum) = (kind,number)
            }
        }
    }
    largestKind
    largestNum
    //------------------------------
}

func WhileLoopConstruct()
{
    var n = 1
    
    while n < 100 {
        n *= 2
    }
    n
    
    var m = 1
    do {
     m *= 2
    } while m < 100
    m
    
    var firstForLoop = 1
    for i in 0..3 {
        firstForLoop += i
    }
    firstForLoop
    
    var secondForLoop = 1
    for var i = 0; i < 3 ; i++ {
        secondForLoop += i
    }
    secondForLoop
}

func greetings(name:String, day:String) -> String {
        return "Hello \(name) today is \(day)"
}


func greetingsForLunch(name:String, lunchMenu:String) -> String {
    return "Hello \(name), today's lunch menu is \(lunchMenu)"
}

func FunctionsConstruct()
{
    var message = greetings("Hitesh", "Monday")

    //-------------------------
    /*
    EXPERIMENT
    Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
    */
    var anotherMessage = greetingsForLunch("Hitesh", "Chicken cury")
    
    //-------------------------
}

func SumOf(numbers:Int...) -> Int{
    var sum = 0
    
    for num in numbers{
        sum += num
    }
    return sum
}

func AverageOfSum(numbers:Int...) -> Int {
    var sum = 0,i = 0
    for numb in numbers {
        sum += numb
        i++
    }
    return (sum / i)
}

func FunctionWithVariableArgConstruct()
{
    SumOf(1,2,3,4)
 
    //--------------------
    /* EXPERIMENT
    Write a function that calculates the average of its arguments
    */
    AverageOfSum(1,2,3,4)
    //--------------------
}

func makeIncrementer() -> (Int -> Int){
    func addOne (number:Int) ->Int{
        return number+1
    }
    return addOne
}

func FunctionReturnsFunctionConstruct()
{
    var increment = makeIncrementer()
    increment(7)
}

func hasAnyMatches(list:Int[], condition:Int->Bool) ->Bool
{
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number:Int) -> Bool {
    return (number < 10) ? true : false
}

func FunctionAsAnArgToFunctionConstruct()
{
    var list = [1,23,4]
    hasAnyMatches(list, lessThanTen)
 
    var res = list.map({
        (number: Int) -> Int in

        let result = 3 * number
        return result
    })
    
    res
    
}

func ClosureConstruct()
{
    var list = [1,4,5]
    var result = list.map({
        (number: Int) -> Int in
        
        let result = 3 * number
        return result
        })
    
    result
    
    //----------------------
    /* 
    EXPERIMENT
    Rewrite the closure to return zero for all odd numbers
    */
    
    var resultOddNumZero = list.map(){
        (number: Int) -> Int in
        return (number % 2) == 0 ? 3 * number : 0
    }
    
    //----------------------
    
    var descendingOrder = sort([1,5,8,2,3]) {$1 < $0}
    descendingOrder
}

func ObjectsAndClassConstruct()
{
    class Shape{
        var numberOfSides = 0
        /* EXPERIMENT
        Add a constant property with let, and add another method that takes an argument.”
        */
        
        let defaultColorCode = 0
        
        func simpleDescription() -> String{
            return "A Shape with \(numberOfSides) sides."
        }
        
        func paintWithColor(colorCode:Int) -> String{
            return "Sides are painted with color code \(colorCode)"
        }
    }
    
    var s = Shape()
    s.numberOfSides = 7;
    s.simpleDescription ()
    s.paintWithColor(s.defaultColorCode)
}

//------------------------------------------------------------------------------------
// Classes

class NamedShape {
    var numberOfSides = 0
    var name: String
    
    init(name:String){
        self.name = name
    }
    
    func simpleDescription() -> String{
        return "A shape with \(self.numberOfSides) sides and \(self.name)"
    }
}

class Square :NamedShape {
    var sideLength : Double
    
    init(sideLength: Double, name: String){
     self.sideLength = sideLength
     super.init(name: name)
     numberOfSides = 4
    }
    
    func area() -> Double {
        return self.sideLength * self.sideLength
    }
    
    override func simpleDescription() -> String{
        return "A square with sides of length \(sideLength)"
    }
}

func SuperClassConstruct(){
    var squre = Square(sideLength:5.2, name:"Test")
    squre.area()
    squre.simpleDescription()
}

/*EXPERIMENT
    Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area and a describe method on the Circle class.”

*/

class Circle : NamedShape {
    var radius: Double
    
    init(radius: Double, name: String){
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() -> Double{
        return 3.14 * self.radius * self.radius
    }
    
    override func simpleDescription() -> String{
        return "A circle with radius \(self.radius)"
    }
}

func OverrideMethodConstruct()
{
    var circle = Circle(radius:3.0, name:"Test")
    circle.area()
    circle.simpleDescription()
}

class EquilateralTriangle: NamedShape {
    var sideLength : Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength // Step 1: Setting the value of properties declared in subclass
        super.init(name: name) // Step 2: Calling SuperClass initiliser
        numberOfSides = 3 // Step 3: Changing the values of properties declared in super class
    }
    
    var perimeter : Double {
        get {
            return 3.0 * self.sideLength
        }
        set /*(anotherValue)*/ {
            sideLength = newValue /*anotherValue*/ / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "Triangle with perimeter \(self.perimeter)"
    }
}

func GetterSetterConstruct()
{
    var triangle = EquilateralTriangle(sideLength: 4, name:"Triangle")
    triangle.perimeter
    triangle.perimeter = 36.0
    triangle.perimeter
    triangle.simpleDescription()
}

class TriangleAndSqure {
    var triangle : EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength //Make sure side length of square stays same as triangle
        }
    }
    
    var square : Square {
        willSet {
            triangle.sideLength = newValue.sideLength //Make sure side length of triangle stays same as square
        }
    }
    init(size: Double, name:String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name:name)
    }
}

func WillSetConstruct(){
    var triangleAndSqure = TriangleAndSqure(size:10, name:"TriangleAndSquare")

    triangleAndSqure.square
    triangleAndSqure.triangle

    triangleAndSqure.square = Square(sideLength:50, name:"Larger Square")
    triangleAndSqure.triangle.sideLength
}

class Counter {
    var count:Int = 0

    // Parameters name in methods
    func incrementBy(amount:Int, numberOfTimes times:Int){
        count += amount * times
    }
}

func ParameterInFuncConstruct()
{
    var counter = Counter()
    counter.incrementBy(10,numberOfTimes:7)
}
//------------------------------------------------------------------------------------
// enum: “Like classes and all other named types, enumerations can have methods associated with them”

enum Rank:Int {
    case Ace = 1   // raw values are assigned in order
    case One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription()->String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
    
    func compareRank(anotherRank: Rank)-> Bool {
        return self.toRaw() == anotherRank.toRaw()
    }
}

func EnumConstruct(){
/*  EXPERIMENT
    Write a function that compares two Rank values by comparing their raw values. 
*/
    
    let rank = Rank.fromRaw(12)
    var jack = rank?.simpleDescription()
    rank?.compareRank(Rank.Jack)
}



//simpleValues()
//ArrayConstruct()
//DictionaryConstruct()
//OptionalValues()
//SwitchConstruct()
//ForLoopConstruct()
//WhileLoopConstruct()
//FunctionsConstruct()
//FunctionWithVariableArgConstruct()
//FunctionReturnsFunctionConstruct()
//FunctionAsAnArgToFunctionConstruct()
//ClosureConstruct()
//ObjectsAndClassConstruct()

//SuperClassConstruct()
//OverrideMethodConstruct()
//GetterSetterConstruct()
//WillSetConstruct()
//ParameterInFuncConstruct()
EnumConstruct()



