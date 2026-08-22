
import SwiftUI

struct ITDAloginmain: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("IT-DA logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 45)

            ITDAstartdiscription()
                .padding(.top, 46)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

#Preview {
    ITDAloginmain()
}
