//
//  ExpenseRepository.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

protocol ExpenseRepository {
    func add(_ expense: Expense) async throws
    
    func list(month: YearMonth) async throws -> [Expense]
    
}
