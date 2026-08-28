//
//  Information.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/28/26.
//

import SwiftUI

struct ITDALoginPassword1: View {
    let ITDAAddInformation = "추가 정보"
    let ITDAAddInformationEnter = "추가 정보 입력"
    let ITDAdetails = "매칭 품질을 높이기 위해 몇 가지 정보를 입력해 주세요"
    
    @State private var id = ""
    @State private var password = ""
    @State private var choice = ""
    

    var body: some View {
        VStack(spacing: 0){
            Text(ITDAAddInformation)
                .font(.custom("Pretendard-Bold", size: 23))
                .foregroundStyle(Color("text"))
                .padding(.top,26.5)
            
            Image("Line 1")
                .resizable()
                .frame(width: 402, height: 2)
                .padding(.top, 11.5)
            
            Text(ITDAAddInformationEnter)
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
            
            VStack(spacing:0)
            {
                textField(title: "이름", placeholder: "예: 홍길동, 가나다, 하치와레", text: $id)
                Dropdown(text: "관심 분야", value: "Back-End")
                    .padding(.top, 19)
                textField(title: "기술 스텍", placeholder: "예: Python, Figma, Swift", text: $choice)
                    .padding(.top, 19)
            }
            .padding(.horizontal, 26)
            .padding(.top, 19.5)
        }
        Spacer().frame(height: 297)
            
        ITDAPrimaryButton(title: "계정만들기"){}
            .padding(.horizontal, 26.5)
            .padding(.bottom, 9.5)
            
    }
}
#Preview {
    ITDALoginPassword1()
}

