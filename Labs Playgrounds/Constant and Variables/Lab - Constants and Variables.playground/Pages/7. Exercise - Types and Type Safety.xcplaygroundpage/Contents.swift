/*:
## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking the variable name.
 */

var firstDecimal: Double = 5.7
var secondDecimal: Double = 3.2

//:  Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.

var trueOrFalse: Bool = true

// Boolean to a Double  (NOT COMPILING)
// firstDecimal = trueOrFalse
print("You cannot assign a Bool to a Double because they are different types. Swift is a type-safe language.")


//:  Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.

var stringValue: String = "Hello"
print("You cannot assign a String to a Double because they are not compatible types.")



//:  Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.


var wholeNumber: Int = 10
print("You cannot assign an Int to a Double directly because Swift does not automatically convert between numeric types.")



/*:
[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
 */
