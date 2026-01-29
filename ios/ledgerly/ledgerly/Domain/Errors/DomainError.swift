//
//  DomainErrors.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

enum DomainError: Error, Equatable {
    case invalidAmount
    case invalidCurrencyCode
}
