//
//  ContentView.swift
//  Arcadia
//
//  Created by Tom Stevens on 06/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.custom("Jersey10-Regular", size: 32))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
