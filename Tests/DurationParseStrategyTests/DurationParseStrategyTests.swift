import XCTest
@testable import DurationParseStrategy

final class DurationParseStrategyTests: XCTestCase {
    func test_withSecond() throws {
        try assertParser(
            .duration(locale: Locale(identifier: "en")),
            parserInput: "1 second",
            expectedOutput: DateComponents(second: 1)
        )
    }
    
    func test_withMinute() throws {
        try assertParser(
            .duration(locale: Locale(identifier: "en")),
            parserInput: "1 minute",
            expectedOutput: DateComponents(minute: 1)
        )
    }
    
    func test_withHour() throws {
        try assertParser(
            .duration(locale: Locale(identifier: "en")),
            parserInput: "1 hour",
            expectedOutput: DateComponents(hour: 1)
        )
    }
    
    func test_caseInsensitive() throws {
        try assertParser(
            .duration(locale: Locale(identifier: "en")),
            parserInput: "1 HOUR",
            expectedOutput: DateComponents(
                hour: 1
            )
        )
    }
    
    func test_withFullSamples() throws {
        try assertParser(
            .duration(locale: Locale(identifier: "en")),
            parserInput: "1 hour 1 minutes 5 seconds",
            expectedOutput: DateComponents(
                hour: 1,
                minute: 1,
                second: 5
            )
        )
    }
    
    func assertParser<P: ParseStrategy>(_ parser: P, parserInput: P.ParseInput, expectedOutput: P.ParseOutput) throws where P.ParseOutput: Equatable {
        XCTAssertEqual(try parser.parse(parserInput), expectedOutput)
    }
}
