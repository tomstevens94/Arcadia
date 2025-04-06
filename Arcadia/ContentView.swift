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
                    .font(Font.custom("Pixel-Regular", size: 24))
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
