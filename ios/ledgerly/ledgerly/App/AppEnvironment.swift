//
//  AppEnvironment.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation
import Combine

final class AppEnvironment: ObservableObject {
    
    let expenseRepository: ExpenseRepository
    let addExpense: AddExpense
    let listExpenses: ListExpenses

    init() {
        let seed: [Expense] = [
                Expense(amount: 12.50, currencyCode: "EUR", date: .now),
                Expense(amount: 8.99, currencyCode: "EUR", date: .now.addingTimeInterval(-3600 * 24)),
                Expense(amount: 24.10, currencyCode: "EUR", date: .now.addingTimeInterval(-3600 * 48))
            ]
        
        let repo = InMemoryExpenseRepository(seed: seed)
        self.expenseRepository = repo
        self.addExpense = AddExpense(expenseRepository: repo)
        self.listExpenses = ListExpenses(repository: repo)
    }
}
