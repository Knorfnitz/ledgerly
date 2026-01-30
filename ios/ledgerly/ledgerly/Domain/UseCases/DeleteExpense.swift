//
//  DeleteExpense.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 30.01.26.
//
import Foundation

struct DeleteExpense {
    private let expenseRepository: ExpenseRepository

    init(expenseRepository: ExpenseRepository) {
        self.expenseRepository = expenseRepository
    }

    func execute(id: UUID) async throws {
        try await expenseRepository.delete(id: id)
    }
}
