//
//  ITDABottomTabBar.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

enum ITDATab: String {
    case home = "홈"
    case explore = "탐색"
    case notification = "알림"
    case my = "My"
}

struct ITDABottomTabBar: View {
    @Binding var selectedTab: ITDATab
    var onCreateTap: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Button {
                    selectedTab = .home
                } label: {
                    VStack(spacing: 4) {
                        Image("home")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(selectedTab == .home ? Color("main") : Color("sub"))
                            .scaledToFit()
                            .frame(width: 20, height: 20)

                        Text("홈")
                            .font(.custom("Pretendard-Medium", size: 10))
                            .foregroundStyle(selectedTab == .home ? Color("main") : Color("sub"))
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Button {
                    selectedTab = .explore
                } label: {
                    VStack(spacing: 4) {
                        Image("book")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(selectedTab == .explore ? Color("main") : Color("sub"))
                            .scaledToFit()
                            .frame(width: 20, height: 20)

                        Text("탐색")
                            .font(.custom("Pretendard-Medium", size: 10))
                            .foregroundStyle(selectedTab == .explore ? Color("main") : Color("sub"))
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Button(action: onCreateTap) {
                    Image("plus")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(width: 34, height: 34)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)

                Button {
                    selectedTab = .notification
                } label: {
                    VStack(spacing: 4) {
                        Image("bell")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(selectedTab == .notification ? Color("main") : Color("sub"))
                            .scaledToFit()
                            .frame(width: 20, height: 20)

                        Text("알림")
                            .font(.custom("Pretendard-Medium", size: 10))
                            .foregroundStyle(selectedTab == .notification ? Color("main") : Color("sub"))
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Button {
                    selectedTab = .my
                } label: {
                    VStack(spacing: 4) {
                        Image("user")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(selectedTab == .my ? Color("main") : Color("sub"))
                            .scaledToFit()
                            .frame(width: 20, height: 20)

                        Text("My")
                            .font(.custom("Pretendard-Medium", size: 10))
                            .foregroundStyle(selectedTab == .my ? Color("main") : Color("sub"))
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
            .frame(height: 58)
            .padding(.top, 12)
            .padding(.horizontal, 25)

            Spacer(minLength: 0)

            Capsule()
                .fill(Color.black)
                .frame(width: 134, height: 5)
                .padding(.bottom, 8)
        }
        .frame(height: 124)
        .background(.white)
    }
}

struct ITDABottomTabBar_Previews: PreviewProvider {
    struct PreviewScreen: View {
        @State private var selectedTab: ITDATab = .notification

        var body: some View {
            VStack(spacing: 0) {
                Spacer()
                ITDABottomTabBar(selectedTab: $selectedTab)
            }
            .frame(width: 393, height: 852)
            .background(.white)
        }
    }

    static var previews: some View {
        PreviewScreen()
    }
}
