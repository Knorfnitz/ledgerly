//
//  Expense.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//
import Foundation

struct Expense: Identifiable, Equatable, Hashable {
    typealias ID = UUID

    let id: ID
    var amount: Decimal
    var currencyCode: String
    var date: Date
    var categoryId: Category.ID?
    var merchant: String?
    var note: String?

    init(
        id: ID = UUID(),
        amount: Decimal,
        currencyCode: String = "EUR",
        date: Date = .now,
        categoryId: Category.ID? = nil,
        merchant: String? = nil,
        note: String? = nil
    ) {
        self.id = id
        self.amount = amount
        self.currencyCode = currencyCode
        self.date = date
        self.categoryId = categoryId
        self.merchant = merchant
        self.note = note
    }
}
