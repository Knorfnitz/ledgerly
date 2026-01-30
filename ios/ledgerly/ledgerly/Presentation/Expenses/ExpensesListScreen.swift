import SwiftUI

struct ExpensesListScreen: View {
    @StateObject var viewModel: ExpensesListViewModel
    let addExpense: AddExpense

    @State private var isAddSheetPresented = false
    @State private var month = YearMonth.current()

    var body: some View {
        NavigationStack {
            ExpensesListView(
                expenses: viewModel.expenses,
                isLoading: viewModel.isLoading,
                errorMessage: viewModel.errorMessage
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
    }
}
