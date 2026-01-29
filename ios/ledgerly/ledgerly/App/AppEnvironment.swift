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
        let repo = InMemoryExpenseRepository()
        self.expenseRepository = repo
        self.addExpense = AddExpense(expenseRepository: repo)
        self.listExpenses = ListExpenses(repository: repo)
    }
}
