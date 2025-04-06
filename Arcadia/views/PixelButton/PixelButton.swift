import SwiftUI

struct PixelButton<Content: View>: View {
    var fullWidth: Bool = false
    var backgroundColor = Color.green
    var buttonDepth: CGFloat = 16
    var minimiseHighlights: Bool = false
    var action: () -> Void
    var content: () -> Content
    
    @State private var isPressed = false
    
    let pixelSize: CGFloat = 2
    
    var buttonTop: some View {
        return GeometryReader { geometry in
            PixelButtonTop(
                size: geometry.size,
                pixelSize: pixelSize,
                backgroundColor: backgroundColor,
                minimiseHighlights: minimiseHighlights
            )
        }
    }
    
    var buttonEdge: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(backgroundColor.mix(with: .black, by: 0.2))
                .frame(width: pixelSize)
                .padding(.bottom, pixelSize)
            
            Rectangle()
                .fill(backgroundColor.mix(with: .black, by: 0.1))
            
            Rectangle()
                .fill(backgroundColor.mix(with: .white, by: 0.3))
                .frame(width: pixelSize)
                .padding(.bottom, pixelSize)
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: -pixelSize) {
            content()
                .padding(8)
                .padding(.horizontal, 16)
                .padding(.bottom, pixelSize)
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .background(buttonTop)
                .zIndex(1)
            
            buttonEdge
                .zIndex(0)
                .frame(height: buttonDepth + pixelSize)
        }
        .animation(.linear(duration: 0.1), value: buttonDepth)
        .offset(CGSize(width: 0, height: isPressed ? buttonDepth - pixelSize : 0))
        .mask(buttonEdge)
        .fixedSize(horizontal: !fullWidth, vertical: false)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(Animation.easeIn(duration: 0.025)) {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    action()
                    
                    withAnimation(Animation.easeOut(duration: 0.2)) {
                        isPressed = false
                    }
                }
        )
    }
}

#Preview {
    PixelButton(fullWidth: false, action: {
        print("ACTION!!")
    }) {
        VStack {
            HStack {
                PixelText("button")
                    .foregroundColor(.white.opacity(0.9))
            }
        }
    }
    .padding()
}
