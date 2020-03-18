import XCTest
@testable import Formathilda

final class FormathildaTests: XCTestCase {
    let formathilda = Formathilda(symbol: "*", format: "(***) ***-****")
    
    func testEmptyString() {
        let output = formathilda.format("")
        
        XCTAssertEqual(output, "")
    }
    
    func testPartial() {
        let output = formathilda.format("123456")
        
        XCTAssertEqual(output, "(123) 456")
    }
    
    func testFull() {
        let output = formathilda.format("1234567890")
        
        XCTAssertEqual(output, "(123) 456-7890")
    }
    
    func testCanEdit() {
        XCTAssertTrue(formathilda.canEdit("1234567"))
    }
    
    func testCannotEdit() {
        XCTAssertFalse(formathilda.canEdit("12345678901"))
    }
}
