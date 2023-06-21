import Foundation
import Parsing

extension DateComponents {
    /// A parser that parses a duration.
    public struct DurationParseStrategy: ParseStrategy {
        private let locale: Locale
        
        public init(locale: Locale = .autoupdatingCurrent) {
            self.locale = locale
        }
        
        public func parse(_ value: String) throws -> DateComponents {
            let parser = DateComponentsParser(locale: locale)
            
            return try parser.parse(value.lowercased())
        }
    }
}

extension ParseStrategy where Self == DateComponents.DurationParseStrategy {
    /// Returns a duration parser for the given locale. If the locale is not supported by the parser, it falls back to english.
    /// - Parameter locale: The locale to use for parsing.
    /// - Returns: A duration parser for the given locale.
    public static func duration(locale: Locale = .autoupdatingCurrent) -> Self {
        return Self(locale: locale)
    }
    
    /// Returns a duration parser for the default locale. If the locale is not supported by the parser, it falls back to english.
    public static var duration: Self {
        return self.duration()
    }
}
