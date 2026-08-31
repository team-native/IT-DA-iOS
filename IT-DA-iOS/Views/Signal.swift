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
        Text(Signalforms)
            .font(.custom("Pretendard-Regular",size: 15))
            .foregroundStyle(Color("place"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 28.5)
            .padding(.top, 14.5)
        
    }

}
#Preview{
    Signal()
}
