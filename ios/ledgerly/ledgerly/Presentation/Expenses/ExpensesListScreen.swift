//
//  ExpensesListScreen.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 30.01.26.
//

import SwiftUI

struct ExpensesListScreen: View {
    @StateObject var viewModel: ExpensesListViewModel

    var body: some View {
        ExpensesListView(
            expenses: viewModel.expenses,
            isLoading: viewModel.isLoading,
            errorMessage: viewModel.errorMessage
        )
        .task {
            let now = Date()
            let components = Calendar.current.dateComponents([.year, .month], from: now)

            let currentMonth = YearMonth(
                year: components.year ?? 2025,
                month: components.month ?? 1
            )

            await viewModel.load(month: currentMonth)
        }
    }
}
