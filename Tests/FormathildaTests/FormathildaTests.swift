import XCTest
@testable import Formathilda

final class FormathildaTests: XCTestCase {
    let formathilda = try? Formathilda(symbol: "*", format: "(***) ***-****")
    
    func testNilInput() {
        let output = formathilda?.format(nil)
        
        XCTAssertEqual(output, "")

    }
    
    func testEmptyInput() {
        let output = formathilda?.format("")
        
        XCTAssertEqual(output, "")
    }
    
    func testPartialInput() {
        let output = formathilda?.format("123456")
        
        XCTAssertEqual(output, "(123) 456")
    }
    
    func testFullInput() {
        let output = formathilda?.format("1234567890")
        
        XCTAssertEqual(output, "(123) 456-7890")
    }
    
    func testProcessingLimitsToFormat() {
        let output = formathilda?.process("12345678901234567890")
        
        XCTAssertEqual(output, "(123) 456-7890")
    }
}
