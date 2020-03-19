//
//  Formathilda.swift
//  Formathilda
//
//  Created by Oren Farhan on 17/03/2020.
//  Copyright © 2020 Oren Farhan. All rights reserved.
//

import Foundation

public struct Formathilda {
    public let symbol: String
    public let format: String
    
    /// Initialiases an instance of Formathilda
    /// - Parameters:
    ///   - symbol: A symbol (one character string) to represent input. For example: "#"
    ///   - format: A string representing the full, desired format. For Example: "##-##-#### (####)
    public init(symbol: String, format: String) throws {
        guard !format.isEmpty else {
            throw FormathildaError.format
        }
        guard symbol.count == 1 else {
            throw FormathildaError.symbol
        }
        self.symbol = symbol
        self.format = format
    }
}

public extension Formathilda {
    func format(_ input: String?) -> String {
        guard let input = input else { return "" }
        guard !input.isEmpty else { return input }
        
        var index = 0
        var inputCopy = input
        var output = ""
        
        while !inputCopy.isEmpty {
            guard index < format.count else { break }
            let currentInputCharacter = readCharacter(at: index, from: format)
            if currentInputCharacter != symbol {
                output.append(currentInputCharacter)
            } else {
                let removed = inputCopy.removeFirst()
                output.append(removed)
            }
            index += 1
        }
        
        return output
    }
    
    func process(_ input: String?) -> String {
        guard let input = input else { return "" }
        guard !input.isEmpty else { return input }
        
        var index = 0
        var inputCopy = input
        var output = ""
        
        while !inputCopy.isEmpty {
            guard index < format.count else { break }
            let currentInputCharacter = readCharacter(at: 0, from: inputCopy)
            let currentFormatCharacter = readCharacter(at: index, from: format)
            if currentFormatCharacter == currentInputCharacter || currentFormatCharacter == symbol {
                let copy = inputCopy.removeFirst()
                output.append(copy)
            } else {
                output.append(currentFormatCharacter)
            }
            index += 1
        }
        
        return output
    }
    
    func process(_ input: String?,
                 replacingCharactersIn range: NSRange,
                 with replacementText: String) -> String {
        guard let input = input,
            let range = Range(range, in: input) else { return "" }
        let completeInput = input.replacingCharacters(in: range,
                                                      with: replacementText)
        return process(completeInput)
    }
    
    private func readCharacter(at index: Int, from sourceString: String) -> String {
        let characterIndex = sourceString.index(sourceString.startIndex, offsetBy: index)
        return String(sourceString[characterIndex])
    }
}
