//
//  ledgerlyApp.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import SwiftUI

@main
struct ledgerlyApp: App {
    private let env = AppEnvironment()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(env)
        }
    }
}
