import Foundation
import Parsing

struct DateComponentsParser: Parser {
    let locale: Locale
    
    var body: some Parser<Substring, DateComponents> {
        Parse { (hour: Int?, minute: Int?, second: Int?) in
            return DateComponents(hour: hour, minute: minute, second: second)
        } with: {
            DateComponentParser(symbols: locale.hourSymbols)
            Skip {
                Optionally {
                     Whitespace(.horizontal)
                }
            }
            DateComponentParser(symbols: locale.minuteSymbols)
            Skip {
                Optionally {
                     Whitespace(.horizontal)
                }
            }
            DateComponentParser(symbols: locale.secondSymbols)
        }
    }
}
