//
//  ITDAPopup.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/21/26.
//

import SwiftUI

struct ITDAPopup: View {
    let title: String
    let message: String
    var cancelTitle = "Cancel"
    var confirmTitle = "Sign Out"
    var onCancel: () -> Void = {}
    var onConfirm: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 17))
                    .foregroundStyle(Color("text"))

                Text(message)
                    .font(.custom("Pretendard-Medium", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("text"))
                    .lineSpacing(1)
            }
            .padding(.horizontal, 22)
            .padding(.top, 24)
            .padding(.bottom, 20)

            Rectangle()
                .fill(Color("line"))
                .frame(height: 1)

            HStack(spacing: 0) {
                Button(cancelTitle, action: onCancel)
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundStyle(Color("sky"))
                    .frame(maxWidth: .infinity, minHeight: 44)

                Rectangle()
                    .fill(Color("line"))
                    .frame(width: 1, height: 44)

                Button(confirmTitle, action: onConfirm)
                    .font(.custom("Pretendard-Medium", size: 13))
                    .foregroundStyle(Color("danger"))
                    .frame(maxWidth: .infinity, minHeight: 44)
            }
            .buttonStyle(.plain)
        }
        .frame(width: 267)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.12), radius: 24, x: 0, y: 10)
    }
}

struct ITDAPopup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("line")
                .ignoresSafeArea()

            ITDAPopup(
                title: "Are you sure?",
                message: "This will only sign you out of IT-DA.\nAre you really going to walk out?"
            )
        }
        .frame(width: 393, height: 852)
    }
}
