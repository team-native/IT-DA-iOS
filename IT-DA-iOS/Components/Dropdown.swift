import SwiftUI

struct Dropdown: View {
    let text: String
    let value: String
    var tap: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text(text)
                .font(.custom("Pretendard-SemiBold", size: 16))
                .foregroundStyle(Color("place"))

            Button(action: tap) {
                HStack {
                    Text(value)

                    Spacer()

                    Image("arrow")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                }
                .font(.custom("Pretendard-Regular", size: 15))
                .foregroundStyle(Color("text"))
                .padding(.horizontal, 15)
                .frame(height: 44)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color("border"))
                }
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    Dropdown(text: "관심 분야", value: "Back-end")
        .padding()
}
