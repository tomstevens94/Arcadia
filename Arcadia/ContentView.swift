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
            PixelButton(action: {
                print("PRESS")
            }) {
                PixelText("Hello, world!")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
