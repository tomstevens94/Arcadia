import SwiftUI

struct PixelButtonTop: View {
    var size: CGSize
    var pixelSize: CGFloat
    var backgroundColor: Color
    var minimiseHighlights: Bool = false
    
    var highlightColorLow: Color {
        backgroundColor.mix(
            with: Color.white,
            by: 0.2
        )
    }

    var highlightColorMid: Color {
        backgroundColor.mix(
            with: Color.white,
            by: 0.45
        )
    }
    
    var highlightColorHigh: Color {
        backgroundColor.mix(
            with: Color.white,
            by: 0.9
        )
    }
    
    var highlightsLeft: some View {
        VStack {
            Rectangle()
                .fill(highlightColorMid)
                .frame(width: pixelSize, height: size.height * 0.2)

            Spacer()

            Rectangle()
                .fill(highlightColorHigh)
                .frame(width: pixelSize, height: size.height * 0.4)
        }
        .padding(.vertical, pixelSize)
    }
    
    var highlightsCenter: some View {
        ZStack {
            Rectangle()
                .fill(highlightColorLow)
                .frame(width: size.width - (pixelSize * 9), height: pixelSize)
            
            HStack {
                Rectangle()
                    .fill(highlightColorMid)
                    .frame(width: size.width * 0.2, height: pixelSize)
                
                Spacer()
                
                Rectangle()
                    .fill(highlightColorHigh)
                    .frame(width: size.width * 0.1, height: pixelSize)
            }
        }
    }
    
    var highlightsRight: some View {
        VStack {
            Rectangle()
                .fill(highlightColorMid)
                .frame(width: pixelSize, height: size.height * 0.3)
                .padding(.top, pixelSize)
            
            Spacer()
            
            Rectangle()
                .fill(highlightColorHigh)
                .frame(width: pixelSize, height: size.height * 0.1)
                .padding(.bottom, pixelSize)
        }
        .padding(.vertical, pixelSize)
    }
    
    var body: some View {
        ZStack {
             // Button top
            HStack(spacing: 0) {
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: pixelSize)
                    .padding(.vertical, pixelSize)
                    
                
                Rectangle()
                    .fill(backgroundColor)
                
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: pixelSize)
                    .padding(.vertical, pixelSize)
                    
            }
            
            // Highlights
            HStack(alignment: .bottom, spacing: pixelSize) {
                if !minimiseHighlights {
                    highlightsLeft
                }
                
                VStack {
                    Spacer()
                    
                    highlightsCenter
                        .padding(.horizontal, minimiseHighlights ? pixelSize * 2 : 0)
                }
             
                if !minimiseHighlights {
                    highlightsRight
                }
            }
            .padding(.horizontal, pixelSize)
        }
    }
}

#Preview {
    PixelButtonTop(
        size: CGSize(
            width: 10,
            height: 25
        ),
        pixelSize: CGFloat(4),
        backgroundColor: .green
    )
}
