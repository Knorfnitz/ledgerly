//
//  ledgerlyTests.swift
//  ledgerlyTests
//
//  Created by Alexander Hasecke on 29.01.26.
//

import XCTest
@testable import ledgerly

@MainActor
final class ledgerlyTests: XCTestCase {

    func test_execute_throwsWhenAmountIsZeroOrNegative() async {
            let repo = ExpenseRepositorySpy()
        let useCase = AddExpense(expenseRepository: repo)

        let expense = Expense(amount: 0, currencyCode: "EUR")

            do {
                try await useCase.execute(expense)
                XCTFail("Expected to throw")
            } catch let error as DomainError {
                XCTAssertEqual(error, .invalidAmount)
            } catch {
                XCTFail("Unexpected error: \(error)")
            }
        }

        func test_execute_addsExpenseWhenValid() async throws {
            let repo = ExpenseRepositorySpy()
            let useCase = AddExpense(expenseRepository: repo)

            let expense = Expense(amount: 12.50, currencyCode: "EUR")

            try await useCase.execute(expense)

            XCTAssertEqual(repo.addedExpenses.count, 1)
            XCTAssertEqual(repo.addedExpenses.first, expense)
        }

}

// MARK: - Test Double

private final class ExpenseRepositorySpy: ExpenseRepository {
    
    var addedExpenses: [Expense] = []

    func add(_ expense: Expense) async throws {
        addedExpenses.append(expense)
    }
    
    func list(month: YearMonth) async throws -> [Expense] {
        []
    }
}
