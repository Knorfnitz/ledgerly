//
//  DomainErrors.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

public enum DomainError: Error, Equatable {
    case invalidAmount
    case invalidCurrencyCode
}
