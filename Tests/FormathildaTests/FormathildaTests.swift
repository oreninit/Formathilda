import XCTest
@testable import Formathilda

final class FormathildaTests: XCTestCase {
    let formathilda = Formathilda(symbol: "*", format: "(***) ***-****")
    
    func testNilInput() {
        let output = formathilda.format(nil)
        
        XCTAssertEqual(output, "")

    }
    
    func testEmptyInput() {
        let output = formathilda.format("")
        
        XCTAssertEqual(output, "")
    }
    
    func testPartialInput() {
        let output = formathilda.format("123456")
        
        XCTAssertEqual(output, "(123) 456")
    }
    
    func testFullInput() {
        let output = formathilda.format("1234567890")
        
        XCTAssertEqual(output, "(123) 456-7890")
    }
    
    func testNoOverflowInput() {
        let output = formathilda.format("1234567890aaa23")
        
        XCTAssertEqual(output, "(123) 456-7890")
    }
    
    func testAllowOverflowInput() {
        let output = formathilda.format("1234567890aaa23", allowOverflow: true)
        
        XCTAssertEqual(output, "(123) 456-7890aaa23")
    }
    
    func testProcessingLimitsToFormat() {
        let output = formathilda.process("12345678901234567890")
        
        XCTAssertEqual(output, "(123) 456-7890")
    }
    
    func testTextReplacing() {
        let output = formathilda.process("(123)",
                                         replacingCharactersIn: NSRange(location: 5, length: 0),
                                         with: "4")
        
        XCTAssertEqual(output, "(123) 4")
        
        let deleted = formathilda.process(output,
                                          replacingCharactersIn: NSRange(location: 6, length: 1),
                                          with: "")
        
        XCTAssertEqual(deleted, "(123) ")
    }
}
