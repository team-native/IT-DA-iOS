import SwiftUI

struct Editor: View {
    let text: String
    let hint: String
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text(text)
                .font(.custom("Pretendard-Bold", size: 15))

            ZStack(alignment: .topLeading) {
                TextEditor(text: $value)
                    .padding(8)

                if value.isEmpty {
                    Text(hint)
                        .font(.custom("Pretendard-Regular", size: 15))
                        .foregroundStyle(Color("place"))
                        .padding(16)
                }
            }
            .frame(height: 105)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("border"))
            }
        }
    }
}

#Preview {
    Editor(text: "소개", hint: "내용을 입력해주세요", value: .constant(""))
        .padding()
}
