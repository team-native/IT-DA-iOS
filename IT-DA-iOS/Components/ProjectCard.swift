//
//  ITDAProjectCard.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct ITDAProjectCard: View {
    let title: String
    let subtitle: String
    var status: String = "모집 중"
    var chip1: String = ""
    var chip2: String = ""
    var chip3: String = ""
    var meta: String = "IoT과 · 2명, SW과 1명 참여"
    var trailingText: String = "자세히 보기"

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .top, spacing: 10) {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 19))
                    .foregroundStyle(Color("text"))
                    .lineLimit(1)

                Spacer(minLength: 8)

                Text(status)
                    .font(.custom("Pretendard-SemiBold", size: 14))
                    .foregroundStyle(Color("sub"))
                    .padding(.horizontal, 16)
                    .frame(height: 30)
                    .overlay {
                        Capsule()
                            .stroke(Color("border"), lineWidth: 1)
                    }
            }

            Text(subtitle)
                .font(.custom("Pretendard-SemiBold", size: 17))
                .foregroundStyle(Color("sub"))

            if chip1 != "" || chip2 != "" || chip3 != "" {
                HStack(spacing: 8) {
                    if chip1 != "" {
                        ITDAChip(title: chip1)
                    }

                    if chip2 != "" {
                        ITDAChip(title: chip2)
                    }

                    if chip3 != "" {
                        ITDAChip(title: chip3)
                    }
                }
            }

            HStack {
                Text(meta)
                Spacer()
                Text(trailingText)
            }
            .font(.custom("Pretendard-Medium", size: 12))
            .foregroundStyle(Color("sub"))
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 18)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(Color("card"), lineWidth: 1)
        }
    }
}

struct ITDAProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "Home")

            VStack(alignment: .leading, spacing: 22) {
                Text("추천 프로젝트")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundStyle(Color("text"))
                    .padding(.top, 34)

                ITDAProjectCard(
                    title: "학습 플래너 [야무야]",
                    subtitle: "백엔드 개발자 1명 모집",
                    chip1: "Back-end"
                )

                ITDAProjectCard(
                    title: "닮은 포켓몬 검사 [포켓몬백]",
                    subtitle: "iOS 개발자 · 1명 · 디자이너 1명 모집",
                    status: "마감 임박",
                    chip1: "iOS",
                    chip2: "Design"
                )
            }
            .padding(.horizontal, 36)

            Spacer()
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
