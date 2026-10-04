//
//  ITDANavigationBar.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct ITDANavigationBar: View {
    let title: String
    var showsBackButton = false
    var trailingTitle: String?
    var onBack: () -> Void = {}
    var onTrailingTap: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if showsBackButton {
                    Button(action: onBack) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 25, weight: .medium))
                            .foregroundStyle(.black)
                            .frame(width: 52, height: 52)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.07), radius: 18, x: 0, y: 10)
                            )
                    }
                    .buttonStyle(.plain)
                } else {
                    Color.clear.frame(width: 52, height: 52)
                }

                Spacer()

                if let trailingTitle {
                    Button(trailingTitle, action: onTrailingTap)
                        .font(.custom("Pretendard-Bold", size: 13))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .frame(height: 35)
                        .background(Color("main"))
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                } else {
                    Color.clear.frame(width: 52, height: 52)
                }
            }
            .overlay {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 22))
                    .foregroundStyle(Color("text"))
            }
            .padding(.horizontal, 28)
            

        }
        .background(.white)
    }
}

struct ITDANavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "", showsBackButton: true, trailingTitle: "전체 읽음 처리")
    
        }
        .frame(width: 393, height: 44)
        .background(.white)
    }
}
