import SwiftUI

struct Progress: View {
    let text: String
    var value: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(text)
                    .font(.custom("Pretendard-SemiBold", size: 14))

                Spacer()

                Text("\(Int(value * 100))%")
                    .font(.custom("Pretendard-Bold", size: 14))
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color("line"))

                    Capsule()
                        .fill(Color("main"))
                        .frame(width: geometry.size.width * value)
                }
            }
            .frame(height: 8)
        }
    }
}

#Preview {
    Progress(text: "전체 진행률", value: 0.73)
        .padding()
}
