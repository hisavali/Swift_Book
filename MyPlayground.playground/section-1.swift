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
ClosureConstruct()


