//
//  기존아이디비번.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/25/26.
//

import SwiftUI

struct ITDALoginPassword: View {
    let ITDAjointhemembership = "회원 가입"
    @State private var id = ""
    @State private var password = ""
    @State private var confirm = ""

    var body: some View {
        VStack(spacing: 0){
            Text(ITDAjointhemembership)
                .font(.custom("Pretendard-Bold", size: 23))
                .foregroundStyle(Color("text"))
            
            Image("Line 1")
                .resizable()
                .frame(width: 402, height: 2)
                .padding(.top, 11.5)
          
        }
    }
}
#Preview {
ITDALoginPassword()
}
