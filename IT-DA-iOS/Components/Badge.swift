//
//  ITDABadge.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/21/26.
//

import SwiftUI

struct Badge: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.custom("Pretendard-SemiBold", size: 20))
            .foregroundStyle(Color("sub"))
            .padding(.horizontal, 12)
            .frame(height: 22)
            .background(.white)
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(Color("border"), lineWidth: 1)
            }
    }
}

struct ITDAFilledBadge: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.custom("Pretendard-SemiBold", size: 12))
            .foregroundStyle(.white)
            .padding(.horizontal, 12)
            .frame(height: 22)
            .background(Color("main"))
            .clipShape(Capsule())
    }
}

struct ITDABadge_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 8) {
            Badge(text: "Back-end")
            ITDAFilledBadge(title: "수정하기")
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
