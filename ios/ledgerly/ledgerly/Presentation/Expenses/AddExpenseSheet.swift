import SwiftUI

struct AddExpenseSheet: View {
    @Environment(\.dismiss) private var dismiss

    let addExpense: AddExpense
    let onSaved: () async -> Void

    @State private var amountText: String = ""
    @State private var currencyCode: String = "EUR"
    @State private var errorMessage: String?
    @State private var isSaving = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    TextField("e.g. 12.50", text: $amountText)
                        .keyboardType(.decimalPad)

                    if let errorMessage {
                        Text(errorMessage).foregroundStyle(.red)
                    }
                }

                Section("Currency") {
                    TextField("Currency Code", text: $currencyCode)
                        .textInputAutocapitalization(.characters)
                        .autocorrectionDisabled()
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(isSaving ? "Saving…" : "Save") {
                        Task { await save() }
                    }
                    .disabled(isSaving)
                }
            }
        }
    }

    private func save() async {
        errorMessage = nil
        isSaving = true
        defer { isSaving = false }

        let normalized = amountText.replacingOccurrences(of: ",", with: ".")
        guard
            let amount = Decimal(string: normalized, locale: Locale(identifier: "en_US_POSIX")),
            amount > 0
        else {
            errorMessage = "Please enter a valid amount."
            return
        }

        let code = currencyCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard code.count == 3 else {
            errorMessage = "Currency code should be 3 letters (e.g. EUR)."
            return
        }

        do {
            let expense = Expense(amount: amount, currencyCode: code, date: Date())
            try await addExpense.execute(expense)
            await onSaved()
            dismiss()
        } catch let error as DomainError {
        
            errorMessage = "\(error)"
        } catch {
            errorMessage = "Saving failed."
        }
    }
}
