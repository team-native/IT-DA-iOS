//
//  ITDAProjectCard.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct SingalProjectCard: View {
    let title: String
    let subtitle: String
    var status: String = ""
    var meta: String = ""
    var imagename: String = ""
    var time: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .top, spacing: 10) {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 16))
                    .foregroundStyle(Color("text"))
                    .lineLimit(1)

                Spacer(minLength: 8)

                Text(status)
                    .overlay {
                        Capsule()
                            .stroke(Color("border"), lineWidth: 1)
                    }
            }

            Text(subtitle)
                .font(.custom("Pretendard-SemiBold", size: 13))
                .foregroundStyle(Color("sub"))

            HStack {
                Image(imagename)
                Text(meta)
                Text(time)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 2.5)
                
            }
            .font(.custom("Pretendard-Semibold", size: 10))
            .foregroundStyle(Color("sub"))
            .padding(.top, 34.5)
            
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 18)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(Color("main"), lineWidth: 1)
        }
    }
}

struct SingalProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {


            VStack(alignment: .leading, spacing: 22) {
                Text("알림")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundStyle(Color("text"))
                    .padding(.top, 34)

                SingalProjectCard(
                    title: "새 프로젝트 추천",
                    subtitle: "나의 기술 스택과 일치하는 프로그렘이 등록되었습니다.",
                    meta: "안 읽음",
                    imagename: "ball",
                    time: "5 분전"
                )

                SingalProjectCard(
                    title: "자원 결과 도착",
                    subtitle: "백엔드 개발자 1명이 팀에 합류했습니다.",
                    meta:"안 읽힘",
                    imagename: "ball",
                    time: "1시간 전"
                )
            }
            .padding(.horizontal, 26.5)

            Spacer()
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
