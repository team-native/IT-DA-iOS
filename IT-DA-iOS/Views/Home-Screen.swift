//
//  Home-Screen.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/30/26.
//

import SwiftUI
struct HomeScreen : View{
    let upexplanation = "Home"
    let chip1 = ""
    let chip2 = ""
    let chip3 =  ""
    
    var body: some View{
        Text(upexplanation)
            .font(.custom("Pretendard-Bold", size: 23))
        Image("Line 1")
            .padding(.top, 18.5)
        
        ITDAProjectCard(
            title: "AI기반 학습 플래너 [0부0부]",
            subtitle: "백앤드 개발자 1명 모집",
            chip1: "Back-End"
        )
            .padding(.horizontal, 26.5)
        ITDAProjectCard(
            title: "하치와레 키우기 [하키]",
            subtitle: "프론트엔드 개발자 2명 모집",
            chip2: "Back-End"
        )
        .padding(.top, 16.5)
        .padding(.horizontal, 26.5)
    }
}
#Preview{
    HomeScreen()
}
