//
//  front-intro.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/22/26.
//

import SwiftUI

struct ITDAstartdiscription: View {
    
    let titleText = "학교 커뮤니티 기반 프로젝트 협력 플랫폼"
    
    let descriptionText = "로그인 한 번으로 당신의 포트폴리오 첫 줄이 바뀝니다. 퍼즐 조각처럼 딱 맞는 파트너를 만나는 곳"
    
    let buttomText = "소셜 로그인으로 간편하게 가입하고 시작하세요"
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text(titleText)
                .font(.custom("Pretendard-Bold", size: 21))
                .padding(.horizontal, 24)
            
            Spacer().frame(height: 32.5)
            
            Text(descriptionText)
                .font(.custom("Pretendard-Regular", size: 16))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            
        }
    }
}
    

#Preview {
    ITDAstartdiscription()
}
