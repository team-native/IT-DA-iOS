//
//  textField.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/26/26.
//

import SwiftUI

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
