//
//  ITDASelectField.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct ITDASelectField: View {
    let title: String
    let value: String
    var isEnabled = true
    var action: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.custom("Pretendard-Bold", size: 17))
                .foregroundStyle(Color("text"))

            Button(action: action) {
                HStack {
                    Text(value)
                        .font(.custom("Pretendard-SemiBold", size: 16))
                        .foregroundStyle(isEnabled ? Color("place") : Color("place").opacity(0.25))

                    Spacer()

                    Image(systemName: "chevron.down")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(isEnabled ? Color("sub") : Color("place").opacity(0.18))
                }
                .padding(.horizontal, 16)
                .frame(height: 44)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color("place"), lineWidth: 1)
                }
            }
            .buttonStyle(.plain)
            .disabled(!isEnabled)
        }
    }
}

struct ITDASelectField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "추가 정보 입력")

            VStack(alignment: .leading, spacing: 22) {
                Text("추가 정보 입력")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundStyle(Color("text"))
                    .padding(.top, 38)

                Text("매칭 품질을 높이기 위해 몇 가지 정보를 입력해 주세요")
                    .font(.custom("Pretendard-SemiBold", size: 15))
                    .foregroundStyle(Color("sub"))
                    .padding(.bottom, 10)

                ITDASelectField(title: "관심 분야", value: "Back-end") {}
                ITDASelectField(title: "기수", value: "10기") {}
                ITDASelectField(title: "학과", value: "SW과", isEnabled: false) {}
            }
            .padding(.horizontal, 36)

            Spacer()
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
