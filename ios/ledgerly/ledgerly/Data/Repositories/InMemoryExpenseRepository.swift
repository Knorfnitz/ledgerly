//
//  InMemoryExpenseRepository.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

final class InMemoryExpenseRepository: ExpenseRepository {

    private var expenses: [Expense]
    private let calendar: Calendar

    init(seed: [Expense] = [], calendar: Calendar = .current) {
        self.expenses = seed
        self.calendar = calendar
    }

    func add(_ expense: Expense) async throws {
        expenses.append(expense)
    }

    func list(month: YearMonth) async throws -> [Expense] {
        expenses.filter { expense in
            let comps = calendar.dateComponents([.year, .month], from: expense.date)
            return comps.year == month.year && comps.month == month.month
        }
    }
    
    func delete(id: UUID) async throws {
        expenses.removeAll { $0.id == id }
    }
}
