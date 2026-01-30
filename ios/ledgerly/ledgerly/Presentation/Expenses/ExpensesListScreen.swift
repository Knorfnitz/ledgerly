import SwiftUI

struct ExpensesListScreen: View {
    @StateObject var viewModel: ExpensesListViewModel
    let addExpense: AddExpense
    let deleteExpense: DeleteExpense


    @State private var isAddSheetPresented = false
    @State private var month = YearMonth.current()
    @State private var pendingDelete: Expense?

    var body: some View {
        NavigationStack {
            ExpensesListView(
                expenses: viewModel.expenses,
                isLoading: viewModel.isLoading,
                errorMessage: viewModel.errorMessage,
                onDelete: { expense in
                    pendingDelete = expense
                }
            )
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { isAddSheetPresented = true } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
        .task {
            await viewModel.load(month: month)
        }
        .sheet(isPresented: $isAddSheetPresented) {
            AddExpenseSheet(addExpense: addExpense) {
                await viewModel.load(month: month)
            }
        }
        .confirmationDialog(
            "Delete expense?",
            isPresented: Binding(
                get: { pendingDelete != nil },
                set: { if !$0 { pendingDelete = nil } }
            ),
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                guard let expense = pendingDelete else { return }
                pendingDelete = nil
                Task {
                    try await deleteExpense.execute(id: expense.id)
                    await viewModel.load(month: month)
                }
            }
        } message: {
            if let expense = pendingDelete {
                Text("\(expense.amount, format: .currency(code: expense.currencyCode)) - \(expense.date.formatted(date: .abbreviated, time: .omitted))")
            }
        }
    }
}
