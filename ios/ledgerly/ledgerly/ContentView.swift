//
//  ContentView.swift
//  ledgerly
//
//  Created by Alexander Hasecke on 29.01.26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var env: AppEnvironment
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
