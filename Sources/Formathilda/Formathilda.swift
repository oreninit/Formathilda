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
    public let characterSet: CharacterSet

    /// Initialiases an instance of Formathilda
    /// - Parameters:
    ///   - symbol: A symbol (one character string) to represent input. For example: "#"
    ///   - format: A string representing the full, desired format. For Example: "##-##-#### (####)
    ///   - allowedCharacters: Defines which characters can be passed as input. Default to anything but symbol
    public init(symbol: String, format: String, allowedCharacters: String? = nil) {
        self.symbol = symbol
        self.format = format
        if let allowed = allowedCharacters {
            characterSet = CharacterSet(charactersIn: allowed).inverted // Just allowed characters
        } else {
            characterSet = CharacterSet(charactersIn: symbol) // Anything but symbol
        }
    }
    
    func canEdit(_ input: String) -> Bool {
        return input.count <= format.filter({ String($0) == symbol }).count
    }
    
    func format(_ input: String) -> String {
        assert(input.rangeOfCharacter(from: characterSet) == nil)
        guard !input.isEmpty else { return input }
        
        var index = 0
        var inputCopy = input
        var output = ""
        
        while !inputCopy.isEmpty {
            guard index < format.count else { break }
            guard !inputCopy.isEmpty else { break }
            let charIndex = format.index(format.startIndex, offsetBy: index)
            let currentSymbol = String(format[charIndex])
            if currentSymbol != symbol {
                output.append(currentSymbol)
            } else {
                let digit = inputCopy.removeFirst()
                output.append(digit)
            }
            index += 1
        }
        
        return output
    }
}
