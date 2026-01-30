//
//  ExpensesListViewModel.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 30.01.26.
//

import Foundation
import Combine

@MainActor
final class ExpensesListViewModel: ObservableObject {

    @Published private(set) var expenses: [Expense] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?

    private let listExpenses: ListExpenses

    init(listExpenses: ListExpenses) {
        self.listExpenses = listExpenses
    }

    func load(month: YearMonth) async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            expenses = try await listExpenses.execute(month: month)
        } catch {
            errorMessage = "Failed to load expenses"
        }
    }
    
}
