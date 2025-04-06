import SwiftUI

struct PixelText: View {
    var textContent: String
    
    init(_ textContent: String) {
        self.textContent = textContent
    }
    
    var body: some View {
        Text(textContent)
            .font(Font.custom("Early GameBoy", size: 16))
            .kerning(-3)
    }
}

#Preview {
    PixelText("Strings!")
}
