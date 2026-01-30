//
//  ExpensesListView.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 30.01.26.
//

import SwiftUI

struct ExpensesListView: View {
    let expenses: [Expense]
    let isLoading: Bool
    let errorMessage: String?

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            }

            if let errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }

            List(expenses, id: \.id) { expense in
                VStack(alignment: .leading) {
                    Text(
                        expense.amount,
                        format: .currency(code: expense.currencyCode)
                    )
                    Text(expense.date.formatted())
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    ExpensesListView(
        expenses: [
            Expense(amount: 12.50, currencyCode: "EUR", date: .now),
            Expense(amount: 8.99, currencyCode: "EUR", date: .now.addingTimeInterval(-86400))
        ],
        isLoading: false,
        errorMessage: nil
    )
}
