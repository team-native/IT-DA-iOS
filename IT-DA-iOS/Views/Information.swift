//
//  Information.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/28/26.
//

import SwiftUI

struct ITDAaddInformation: View {
    let AddInformation = "추가 정보 입려"
    let details = "매칭 품질을 높이기 위해 몇 가지 정보를 입력해 주세요"
    @State private var name = ""
    @State private var techinque = ""
    @State private var confirm = ""
    var body: some View {
        VStack(spacing: 0){
                Text(AddInformation)
                    .font(.custom("Pretendard-Bold", size: 24))
                Image("Line 1")
                    .resizable()
                    .frame(width: 402, height: 2)
                    .padding(.top, 11.5)
                Text(AddInformation)
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundStyle(Color("text"))
                    .padding(.top, 38)
                    .padding(.leading, 26.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(details)
                    .font(.custom("Pretendard-SemiBold", size: 15))
                    .foregroundStyle(Color("sub"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8.5)
                    .padding(.leading,26.5)
            }
        Spacer().frame(height: 29.5)
        
            VStack(spacing: 0){
                textField(title: "이름", placeholder: "예: 홍길동, 가나다, 하치와레", text: $name)
                
            }
    }
}

    #Preview {
        ITDAaddInformation()
    }

