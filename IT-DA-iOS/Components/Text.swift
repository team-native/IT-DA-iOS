//
//  textField.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct textField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecure = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.custom("Pretendard-Bold", size: 17))
                .foregroundStyle(Color("text"))

            if isSecure {
                SecureField(
                    placeholder,
                    text: $text,
                    prompt: Text(placeholder).foregroundColor(Color("place"))
                )
                .font(.custom("Pretendard-SemiBold", size: 16))
                .foregroundStyle(Color("text"))
                .padding(.horizontal, 16)
                .frame(height: 44)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color("border"), lineWidth: 1)
                }
            } else {
                TextField(
                    placeholder,
                    text: $text,
                    prompt: Text(placeholder).foregroundColor(Color("place"))
                )
                .font(.custom("Pretendard-SemiBold", size: 16))
                .foregroundStyle(Color("text"))
                .padding(.horizontal, 16)
                .frame(height: 44)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color("border"), lineWidth: 1)
                }
            }
        }
    }
}

struct textField_Previews: PreviewProvider {
    struct PreviewScreen: View {
        @State private var id = ""
        @State private var password = ""
        @State private var confirm = ""

        var body: some View {
            VStack(spacing: 0) {
                ITDANavigationBar(title: "회원 가입")

                VStack(alignment: .leading, spacing: 22) {
                    Text("계정 만들기")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundStyle(Color("text"))
                        .padding(.top, 38)

                    Text("서비스를 이용하기 위해 기본 정보를 입력해 주세요")
                        .font(.custom("Pretendard-SemiBold", size: 15))
                        .foregroundStyle(Color("sub"))
                        .padding(.bottom, 10)

                    textField(title: "아이디", placeholder: "6~15글자", text: $id)
                    textField(title: "비밀번호", placeholder: "8~20글자", text: $password, isSecure: true)
                    textField(title: "비밀번호 확인", placeholder: "8~20글자", text: $confirm, isSecure: true)
                }
                .padding(.horizontal, 36)

                Spacer()
            }
            .frame(width: 393, height: 852)
            .background(.white)
        }
    }

    static var previews: some View {
        PreviewScreen()
    }
}
