//
//  ITDAChip.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct ITDAChip: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.custom("Pretendard-SemiBold", size: 14))
            .foregroundStyle(Color("sub"))
            .padding(.horizontal, 12)
            .frame(height: 26)
            .background(.white)
            .overlay {
                Capsule()
                    .stroke(Color("border"), lineWidth: 1)
            }
    }
}

struct ITDAChip_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                ITDAChip(title: "Back-end")
                ITDAChip(title: "iOS")
                ITDAChip(title: "Design")
            }
            Spacer()
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
