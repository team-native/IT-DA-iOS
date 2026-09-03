//
//  Signal.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/31/26.
//

import SwiftUI
struct Signal : View {
    let Signaltext = "알림"
    let Signalforms = "알림 유형"
    var chip1: String = ""
    var chip2: String = ""
    var chip3: String = ""
    var body : some View{
        VStack(spacing: 0){
            ITDANavigationBar(
                title: "",
                showsBackButton: true,
                trailingTitle: "전체 읽은 처리"
            )
            .padding(.top, 5.5)
        }
        Text(Signaltext)
            .font(.custom("Pretendard-SemiBold",size: 21))
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.leading, 28.5)
            .padding(.top, 20.5)
        
        Dropdown(
            text: "알림 유형",
            value: "전체"
        )
        .padding(.horizontal,26.5)
        .padding(.top, 14.5)
        
        VStack(spacing:0){
            SingalProjectCard(
                title: "새 프로젝트 추천",
                subtitle: "나의 기술 스택과 일치하는 프로그렘이 등록되었습니다.",
                meta: "안 읽음",
                imagename: "ball",
                time: "5 분전"
            )
            .padding(.top, 11.5)
            
            SingalProjectCard(
                title: "자원 결과 도착",
                subtitle: "백엔드 개발자 1명이 팀에 합류했습니다.",
                meta:"안 읽힘",
                imagename: "ball",
                time: "1시간 전"
            )
            .padding(.top, 10)
        }
        .padding(.horizontal, 26.5)
    
        
    }

}
#Preview{
    Signal()
}
