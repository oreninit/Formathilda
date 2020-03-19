//
//  File.swift
//  
//
//  Created by Oren Farhan on 19/03/2020.
//

import Foundation

public enum FormathildaError: Error, LocalizedError {
    case format
    case symbol

    public var errorDescription: String? {
        return localizedDescription
    }
    
    public var localizedDescription: String {
        switch self {
        case .format:
            return "Output format is empty."
        case .symbol:
            return "Symbol should contain one character"
        }
    }
}
