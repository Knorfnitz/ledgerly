//
//  AddExpense.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

public struct AddExpense: AddExpenseUseCase {
    private let expenseRepository: ExpenseRepository

    public init(expenseRepository: ExpenseRepository) {
        self.expenseRepository = expenseRepository
    }

    public func execute(_ expense: Expense) async throws {
        guard expense.amount > 0 else { throw DomainError.invalidAmount }
        guard expense.currencyCode.count == 3 else { throw DomainError.invalidCurrencyCode }
        try await expenseRepository.add(expense)
    }
}
