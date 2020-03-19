# This is for Mathilda! (Formathilda)
### Simple problems require simple solutions.

Formathilda is aimed to provide an easy to use formatter, which allows... ehhmmm... easy formatting?
Examples speak louder than English (and me), so let's use some.

Formathilda has two properties: A symbol and a format.

```swift
let formathilda = Formathilda(symbol: "*", format: "(***) ***-****")
```

The API consists of 3 methods.


1. 
```swift
func format(_ input: String?, allowOverflow: Bool = false) -> String
```
This method should be used for a full string formatting, like when you have some content that you want to format for display.
You give it an input, and tells it whether you'd like excess characters (after the formatting is finished) to be included and that's it.

`let output = formathilda.format("1234567890 abcd")"`

 // output ==  "(123) 456-7890"
 
`let output = formathilda.format("1234567890 abcd", allowOverflow: true) // "(123) 456-7890 abcd"`

// output ==  "(123) 456-7890 abcd"



2.
```swift
func process(_ input: String?) -> String
```
This method should be used for real time string formatting, like when you want to update a label when a user types.
It will not add excessive characters.

`let output = formathilda.process("1234567890 abcd")`

// output == "(123) 456-7890"



3.
```swift
func process(_ input: String?, replacingCharactersIn range: NSRange, with replacementText: String) -> String
```
This method is aimed for text field delegates real time formatting. It will not add excessive characters.

```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    textField.text = formathilda.process(textField.text,
                                         replacingCharactersIn: range,
                                         with: string)
    return false
}
```



That's it.

Yes, it can be improved.
Yes, it might not be the most efficient way.
Yes, it uses integers instead of String.Index in some places.

But!

Yes, it is simple to understand.
Yes, it solves simple, common problems.
Yes, it is small and doesn't aim to be too generic.


Use if you want, don't if you don't.

Keep safe and stay healty.
