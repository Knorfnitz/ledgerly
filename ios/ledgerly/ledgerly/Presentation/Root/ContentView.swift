//
//  ContentView.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var env: AppEnvironment

    var body: some View {
        ExpensesListScreen(
            viewModel: ExpensesListViewModel(listExpenses: env.listExpenses),
            addExpense: env.addExpense
        )
    }
}

