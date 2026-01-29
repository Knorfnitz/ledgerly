//
//  ListExpensesTests.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import XCTest
@testable import ledgerly

@MainActor
final class ListExpensesTests: XCTestCase {

    func test_execute_callsRepositoryWithMonth() async throws {
        let repo = ExpenseRepositorySpy()
        let useCase = ListExpenses(repository: repo)

        let month = YearMonth(year: 2026, month: 1)

        _ = try await useCase.execute(month: month)

        XCTAssertEqual(repo.lastListMonth, month)
    }

    func test_execute_returnsRepositoryResult() async throws {
        let repo = ExpenseRepositorySpy()
        let useCase = ListExpenses(repository: repo)

        let month = YearMonth(year: 2026, month: 1)

        let e1 = Expense(amount: 10, currencyCode: "EUR", date: Date(timeIntervalSince1970: 10))
        let e2 = Expense(amount: 20, currencyCode: "EUR", date: Date(timeIntervalSince1970: 20))
        repo.stubbedListResult = [e1, e2]

        let result = try await useCase.execute(month: month)

        XCTAssertEqual(result, [e1, e2])
    }
}

// MARK: - Spy

private final class ExpenseRepositorySpy: ExpenseRepository {
    var addedExpenses: [Expense] = []

    var lastListMonth: YearMonth?
    var stubbedListResult: [Expense] = []

    func add(_ expense: Expense) async throws {
        addedExpenses.append(expense)
    }

    func list(month: YearMonth) async throws -> [Expense] {
        lastListMonth = month
        return stubbedListResult
    }
}
