import SwiftUI

struct PixelButtonRect<Content: View>: View {
    var fullWidth: Bool = false
    var backgroundColor = Color.green
    var buttonDepth: CGFloat = 16
    var minimiseHighlights: Bool = false
    var action: (() -> Void)?
    var content: () -> Content
    
    @State private var isPressed = false
    
    let pixelSize: CGFloat = 4
    
    var buttonTop: some View {
        return GeometryReader { geometry in
            PixelButtonRectTop(
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
        VStack(spacing: -pixelSize) {
            content()
                .font(Font.custom("Jersey10-Regular", size: 32))
                .foregroundColor(.white)
                .padding(8)
//                .padding(.horizontal, 32)
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
                    if let action = action {
                        action()
                    }
                    
                    withAnimation(Animation.easeOut(duration: 0.2)) {
                        isPressed = false
                    }
                }
        )
    }
}

#Preview {
    PixelButtonRect(fullWidth: false, action: {
        print("ACTION!!")
    }) {
        Text("Button")
    }
    .padding()
}
