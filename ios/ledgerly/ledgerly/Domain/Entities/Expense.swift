//
//  Expense.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//
import Foundation

public struct Expense: Identifiable, Equatable, Hashable {
    public typealias ID = UUID

    public let id: ID
    public var amount: Decimal
    public var currencyCode: String
    public var date: Date
    public var categoryId: Category.ID?
    public var merchant: String?
    public var note: String?

    public init(
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
