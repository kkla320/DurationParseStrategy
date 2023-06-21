import Parsing

struct DateComponentParser: Parser {
    let symbols: [String]
    
    var body: some Parser<Substring, Int?> {
        Optionally {
            Int.parser()
            Skip {
                Optionally {
                    Whitespace(.horizontal)
                }
            }
            Skip {
                OneOf {
                    for symbol in symbols {
                        symbol
                    }
                }
            }
        }
    }
}
