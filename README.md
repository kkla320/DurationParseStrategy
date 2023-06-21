# DurationParseStrategy

This repository contains a ParseStrategy to convert strings like "1 hour 2 minutes" into DateComponents.

```swift

let parser: DateComponents.DurationParseStrategy()
let dateComponents = parser.parse("1 hour 2 minutes 5 seconds")

print(dateComponents.hour) // Prints 1
print(dateComponents.minute) // Prints 2
print(dateComponents.second) // Prints 5

```

Currently the parser supports the following languages
- English
- German
