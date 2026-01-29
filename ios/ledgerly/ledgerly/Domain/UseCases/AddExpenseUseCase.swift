//
//  AddExpenseUseCase.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import Foundation

public protocol AddExpenseUseCase {
    func execute(_ expense: Expense) async throws
}
