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
            await viewModel.load(month: YearMonth(year: 2026, month: 1))
        }
    }
}
