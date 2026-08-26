//
//  기존아이디비번.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/25/26.
//

import SwiftUI

struct ITDALoginPassword: View {
    let ITDAjointhemembership = "회원 가입"
    let ITDAaccountcreation = "계정 만들기"
    let ITDAdetails = "서비스를 이용하기 위해 기본 정보를 입력해 주세요."
    @State private var id = ""
    @State private var password = ""
    @State private var confirm = ""

    var body: some View {
        VStack(spacing: 0){
            Text(ITDAjointhemembership)
                .font(.custom("Pretendard-Bold", size: 23))
                .foregroundStyle(Color("text"))
                .padding(.top,89.5)
            
            Image("Line 1")
                .resizable()
                .frame(width: 402, height: 2)
                .padding(.top, 11.5)
        }
            Text(ITDAaccountcreation)
                .font(.custom("Pretendard-semiBold", size: 21))
                .foregroundStyle(Color("main"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 28.5)
                .padding(.top, 28.5)
        
            Text(ITDAdetails)
            .font(.custom("Pretendard-Bold", size: 13))
            .foregroundStyle(Color("sub"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 28.5)
            .padding(.top, 8.5)
    
            
    }
}
#Preview {
ITDALoginPassword()
}
