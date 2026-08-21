//
//  textArea.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/21/26.
//

import SwiftUI

struct textArea: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var height: CGFloat = 82

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if !title.isEmpty {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 17))
                    .foregroundStyle(Color("text"))
            }

            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .font(.custom("Pretendard-SemiBold", size: 16))
                    .foregroundStyle(Color("text"))
                    .scrollContentBackground(.hidden)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)

                if text.isEmpty {
                    Text(placeholder)
                        .font(.custom("Pretendard-SemiBold", size: 16))
                        .foregroundStyle(Color("place"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                }
            }
            .frame(height: height)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("border"), lineWidth: 1)
            }
        }
    }
}

struct ITDAMiniButton: View {
    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(title, action: action)
            .font(.custom("Pretendard-Bold", size: 10))
            .foregroundStyle(Color("sub"))
            .padding(.horizontal, 10)
            .frame(height: 18)
            .background(Color("pale"))
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(Color("border").opacity(0.35), lineWidth: 1)
            }
            .buttonStyle(.plain)
    }
}

struct ITDAMiniDarkButton: View {
    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(title, action: action)
            .font(.custom("Pretendard-Bold", size: 10))
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .frame(height: 18)
            .background(Color("main"))
            .clipShape(Capsule())
            .buttonStyle(.plain)
    }
}

struct ITDAEditableBox: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var height: CGFloat = 82
    var onCancel: () -> Void = {}
    var onEdit: () -> Void = {}

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            textArea(title: title, placeholder: placeholder, text: $text, height: height)

            HStack(spacing: 4) {
                ITDAMiniButton(title: "취소", action: onCancel)
                ITDAMiniDarkButton(title: "수정하기", action: onEdit)
            }
            .padding(.trailing, 6)
            .padding(.bottom, 6)
        }
    }
}

struct textArea_Previews: PreviewProvider {
    struct PreviewScreen: View {
        @State private var text = ""

        var body: some View {
            VStack(spacing: 24) {
                textArea(title: "", placeholder: "", text: $text)
                textArea(title: "자기소개", placeholder: "내용을 입력하세요", text: $text, height: 112)
                ITDAEditableBox(title: "", placeholder: "", text: $text)
            }
            .padding(.horizontal, 36)
            .frame(width: 393, height: 852)
            .background(.white)
        }
    }

    static var previews: some View {
        PreviewScreen()
    }
}
