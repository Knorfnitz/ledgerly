//
//  ListExpenses.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//
import Foundation

struct ListExpenses {
    private let repository: ExpenseRepository

    init(repository: ExpenseRepository) {
        self.repository = repository
    }

    func execute(month: YearMonth) async throws -> [Expense] {
        try await repository.list(month: month)
    }
}
